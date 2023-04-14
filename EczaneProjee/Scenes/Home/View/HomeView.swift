//
//  HomeView.swift
//  EczaneProjee
//
//  Created by Ekrem Alkan on 13.04.2023.
//

import UIKit
import MapKit
import RxSwift

final class HomeView: UIView {
    
    //MARK: - Creating UI Elements
    lazy var mapView: MKMapView = {
        let mapView = MKMapView()
        mapView.translatesAutoresizingMaskIntoConstraints = false
        return mapView
    }()
    
    private lazy var navigationView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        return view
    }()
    
    private lazy var logoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        imageView.image = UIImage(named: "logo")
        return imageView
    }()
    
    private lazy var textFieldLeftImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "searchIcon")
        imageView.tintColor = .darkGray
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    lazy var citySelectionTableView: UITableView = {
       let table = UITableView()
        table.register(CitySelectTableViewCell.self, forCellReuseIdentifier: CitySelectTableViewCell.identifier)
        table.backgroundColor = .white
        table.translatesAutoresizingMaskIntoConstraints = false
        table.layer.masksToBounds = true
        table.layer.cornerRadius = 8
        table.alpha = 0
        return table
    }()
    
    lazy var searchTextField: CustomTextField = {
        let field = CustomTextField(
            placeholder: "Şehir Ara",
            padding: 42,
            cornerRadius: 8,
            backgroundColor: .white,
            isSecureTextEntry: false)
        field.autocapitalizationType = .none
        field.textColor = .black
        field.attributedPlaceholder = NSAttributedString(string:NSLocalizedString("Şehir Ara", comment: ""), attributes: [NSAttributedString.Key.foregroundColor: UIColor.black])
        field.autocorrectionType = .no
        field.translatesAutoresizingMaskIntoConstraints = false
        return field
    }()
    
    
    let mapViewTapGesture: UITapGestureRecognizer = {
        let gesture = UITapGestureRecognizer()
        gesture.cancelsTouchesInView = false
        return gesture
    }()
    
    private let disposeBag = DisposeBag()

    
    var isCitySelectionOpen = false

    //MARK: - Init Methods
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureView()
        addGestureRecogToMapView()
        tapGestureCallbacks()

    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func tapGestureCallbacks() {
        mapViewTapGesture.rx.event.bind { [weak self] recognizer in
            guard let self = self else { return }
            if !citySelectionTableView.frame.contains(self.mapViewTapGesture.location(in: mapView)) {
                makeTableViewAnimation()
            }
        }.disposed(by: disposeBag)
    }
    
    //MARK: - TapGesture to MapView
    
    private func addGestureRecogToMapView() {
        mapView.addGestureRecognizer(mapViewTapGesture)
    }
    
}

//MARK: - UI Elements AddSubview / Setup Constraints

extension HomeView {
    
    private func configureView() {
        backgroundColor = .white
        addSubview()
        setupConstraints()
    }
    
    private func addSubview() {
        addSubview(mapView)
        mapView.addSubview(navigationView)
        navigationView.addSubview(logoImageView)
        mapView.addSubview(searchTextField)
        searchTextField.addSubview(textFieldLeftImageView)
        mapView.addSubview(citySelectionTableView)
    }
    
    private func setupConstraints() {
        mapViewConstraints()
    }
    
    private func mapViewConstraints() {
        NSLayoutConstraint.activate([
            mapView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            mapView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            mapView.topAnchor.constraint(equalTo: self.topAnchor),
            mapView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
        
        NSLayoutConstraint.activate([
            navigationView.leadingAnchor.constraint(equalTo: mapView.leadingAnchor),
            navigationView.trailingAnchor.constraint(equalTo: mapView.trailingAnchor),
            navigationView.topAnchor.constraint(equalTo: mapView.topAnchor),
            navigationView.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height / 10)
        ])
        
        NSLayoutConstraint.activate([
            logoImageView.centerXAnchor.constraint(equalTo: navigationView.centerXAnchor),
            logoImageView.bottomAnchor.constraint(equalTo: navigationView.bottomAnchor, constant: -12),
            logoImageView.heightAnchor.constraint(equalTo: navigationView.heightAnchor, multiplier: 0.3),
            logoImageView.widthAnchor.constraint(equalTo: logoImageView.heightAnchor, multiplier: 1)
        ])
        
        NSLayoutConstraint.activate([
            searchTextField.topAnchor.constraint(equalTo: navigationView.bottomAnchor, constant: 12),
            searchTextField.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 24),
            searchTextField.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -24),
            searchTextField.heightAnchor.constraint(equalTo: navigationView.heightAnchor, multiplier: 0.40)
        ])
        
        NSLayoutConstraint.activate([
            textFieldLeftImageView.leadingAnchor.constraint(equalTo: searchTextField.leadingAnchor,constant: 8),
            textFieldLeftImageView.centerYAnchor.constraint(equalTo: searchTextField.centerYAnchor),
            textFieldLeftImageView.widthAnchor.constraint(equalToConstant: 24),
            textFieldLeftImageView.heightAnchor.constraint(equalToConstant: 24)
        ])
        
        NSLayoutConstraint.activate([
            citySelectionTableView.leadingAnchor.constraint(equalTo: searchTextField.leadingAnchor),
            citySelectionTableView.trailingAnchor.constraint(equalTo: searchTextField.trailingAnchor),
            citySelectionTableView.centerYAnchor.constraint(equalTo: centerYAnchor),
            citySelectionTableView.heightAnchor.constraint(lessThanOrEqualToConstant: UIScreen.main.bounds.height / 3)
        ])
        
    }
    
    
    func makeTableViewAnimation() {
        if !isCitySelectionOpen {
             UIView.animate(withDuration: 0.5) {
                 self.citySelectionTableView.alpha = 1
                 let moveY = self.navigationView.frame.height + 12 + self.searchTextField.frame.height
                 self.citySelectionTableView.transform = CGAffineTransform(translationX: 0, y: -(moveY))
             }
        } else {
            UIView.animate(withDuration: 0.5) {
                self.citySelectionTableView.alpha = 0
                self.citySelectionTableView.transform = .identity
            }
        }
        self.isCitySelectionOpen.toggle()
    }
}
