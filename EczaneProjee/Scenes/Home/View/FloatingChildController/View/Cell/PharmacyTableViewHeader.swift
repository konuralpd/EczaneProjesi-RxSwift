//
//  PharmacyTableViewHeader.swift
//  EczaneProjee
//
//  Created by Mac on 13.04.2023.
//

import UIKit

class PharmacyTableViewHeader: UIView {
    
    lazy var cityLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 20)
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.6
        return label
    }()
    
    lazy var cancelButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(systemName: "xmark"), for: .normal)
        button.imageView?.image?.withTintColor(.black)
        button.imageView?.tintColor = .black
        return button
    }()
    
    lazy var pharmacyCountLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 15)
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.6
        return label
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(cityLabel)
        addSubview(cancelButton)
        addSubview(pharmacyCountLabel)
        
        NSLayoutConstraint.activate([
            cityLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
            cityLabel.topAnchor.constraint(equalTo: topAnchor, constant: 12),
            
            cancelButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8),
            cancelButton.centerYAnchor.constraint(equalTo: cityLabel.centerYAnchor),
            cancelButton.widthAnchor.constraint(equalToConstant: 24),
            cancelButton.heightAnchor.constraint(equalToConstant: 24),
            
            pharmacyCountLabel.leadingAnchor.constraint(equalTo: cityLabel.leadingAnchor),
            pharmacyCountLabel.topAnchor.constraint(equalTo: cityLabel.bottomAnchor, constant: 12)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
}
