//
//  PharmacyTableViewCell.swift
//  EczaneProjee
//
//  Created by Mac on 13.04.2023.
//

import UIKit

class PharmacyTableViewCell: UITableViewCell {
    
    static let identifier = "PharmacyTableViewCell"
    
    private lazy var cellIcon: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFill
        iv.image = UIImage(named: "logo")
        iv.translatesAutoresizingMaskIntoConstraints = false
        return iv
    }()
    
    private lazy var pharmacyName: UILabel = {
        let label = UILabel()
        label.text = "Faruk Eczanesi"
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 16)
        label.textColor = .black
        return label
    }()
    
    private lazy var pharmacyAddress: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Adresasdfasfdasfdasdfas bno 11"
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 14)
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.6
        label.textColor = .systemGray
        return label
    }()
    
    private lazy var pharmacyPhoneNumber: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Adresasdfasfdasfdasdfas bno 11"
        label.font = .systemFont(ofSize: 14)
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.6
        label.textColor = .systemGray
        return label
    }()
    
    private lazy var buttonStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.spacing = 2
        
        return stackView
    }()
    
    private lazy var showLocationButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.showsTouchWhenHighlighted = true
        button.setImage(UIImage(named: "locationPin"), for: .normal)
        return button
    }()
    
    lazy var callButton: UIButton = {
        let button = UIButton()
        button.showsTouchWhenHighlighted = true
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(named: "phone"), for: .normal)
        return button
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureCell()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureCell() {
        
        addSubview()
        setupConstraints()
    }
    
    func setWithData(_ model: Pharmacy) {
        self.pharmacyName.text = model.eczaneAdi
        self.pharmacyAddress.text = model.adresi
        self.pharmacyPhoneNumber.text = model.telefon
    }
}

//MARK: - UI Elements AddSubview / Setup Constraints

extension PharmacyTableViewCell {
    
    private func addSubview() {
        addSubview(cellIcon)
        addSubview(pharmacyName)
        addSubview(pharmacyAddress)
        addSubview(pharmacyPhoneNumber)
        addSubview(buttonStackView)
        buttonStackView.addArrangedSubview(callButton)
        buttonStackView.addArrangedSubview(showLocationButton)
    }
    
    private func setupConstraints() {
        
        NSLayoutConstraint.activate([
            cellIcon.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
            cellIcon.topAnchor.constraint(equalTo: topAnchor, constant: 12),
            cellIcon.widthAnchor.constraint(equalToConstant: 48),
            cellIcon.heightAnchor.constraint(equalToConstant: 48),
            
            pharmacyName.topAnchor.constraint(equalTo: cellIcon.topAnchor, constant: 2),
            pharmacyName.heightAnchor.constraint(equalToConstant: 16),
            pharmacyName.leadingAnchor.constraint(equalTo: cellIcon.trailingAnchor, constant: 6),
            
            pharmacyAddress.topAnchor.constraint(equalTo: pharmacyName.bottomAnchor, constant: 4),
            pharmacyAddress.leadingAnchor.constraint(equalTo: pharmacyName.leadingAnchor),
            pharmacyAddress.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -8),
            
            pharmacyPhoneNumber.topAnchor.constraint(equalTo: pharmacyAddress.bottomAnchor, constant: 6),
            pharmacyPhoneNumber.leadingAnchor.constraint(equalTo: pharmacyAddress.leadingAnchor),
            pharmacyPhoneNumber.trailingAnchor.constraint(equalTo: pharmacyAddress.trailingAnchor),
            
            buttonStackView.topAnchor.constraint(equalTo: pharmacyPhoneNumber.bottomAnchor, constant: 6),
            buttonStackView.widthAnchor.constraint(equalTo: self.contentView.widthAnchor, multiplier: 0.3),
            buttonStackView.trailingAnchor.constraint(equalTo: pharmacyAddress.trailingAnchor),
            buttonStackView.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: -8)
        ])
    }
}
