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
        iv.image = UIImage(named: "pharmacy")
        iv.translatesAutoresizingMaskIntoConstraints = false
        return iv
    }()
    
    private lazy var pharmacyName: UILabel = {
       let label = UILabel()
        label.text = "Faruk Eczanesi"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .boldSystemFont(ofSize: 16)
        label.textColor = .black
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        addSubview(cellIcon)
        addSubview(pharmacyName)
        
        NSLayoutConstraint.activate([
            cellIcon.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
            cellIcon.centerYAnchor.constraint(equalTo: centerYAnchor),
            cellIcon.widthAnchor.constraint(equalToConstant: 48),
            cellIcon.heightAnchor.constraint(equalToConstant: 48),
            
            pharmacyName.centerYAnchor.constraint(equalTo: cellIcon.centerYAnchor),
            pharmacyName.leadingAnchor.constraint(equalTo: cellIcon.trailingAnchor, constant: 6)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
