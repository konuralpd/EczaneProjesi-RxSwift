//
//  HomeView.swift
//  EczaneProjee
//
//  Created by Ekrem Alkan on 13.04.2023.
//

import UIKit
import MapKit

final class HomeView: UIView {
    
    //MARK: - Creating UI Elements
    private lazy var mapView: MKMapView = {
        let mapView = MKMapView()
        mapView.translatesAutoresizingMaskIntoConstraints = false
        return mapView
    }()
    
    private lazy var navigationView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white.withAlphaComponent(0.7)
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
        imageView.image = UIImage(systemName: "magnifyingglass")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private lazy var searchTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.attributedPlaceholder = NSAttributedString(string: "Şehir ara", attributes: [NSAttributedString.Key.foregroundColor: UIColor.black])
        textField.backgroundColor = .white.withAlphaComponent(0.7)
        textField.leftView = textFieldLeftImageView
        textField.leftView?.tintColor = .systemGray
        textField.leftViewMode = .always
        textField.layer.cornerRadius = 12
        textField.layer.masksToBounds = true
        return textField
    }()
    
    //MARK: - Init Methods
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
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
            navigationView.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height / 8)
        ])
        
        NSLayoutConstraint.activate([
            logoImageView.centerXAnchor.constraint(equalTo: navigationView.centerXAnchor),
            logoImageView.bottomAnchor.constraint(equalTo: navigationView.bottomAnchor, constant: -12),
            logoImageView.heightAnchor.constraint(equalTo: navigationView.heightAnchor, multiplier: 0.35),
            logoImageView.widthAnchor.constraint(equalTo: logoImageView.heightAnchor, multiplier: 1)
        ])
        
        NSLayoutConstraint.activate([
            searchTextField.topAnchor.constraint(equalTo: navigationView.bottomAnchor, constant: 12),
            searchTextField.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 24),
            searchTextField.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -24),
            searchTextField.heightAnchor.constraint(equalTo: navigationView.heightAnchor, multiplier: 0.5)
        ])
        
        
    }
}
