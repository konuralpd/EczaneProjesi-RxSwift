//
//  CustomFloatingView.swift
//  EczaneProjee
//
//  Created by Ekrem Alkan on 13.04.2023.
//

import UIKit

final class CustomFloatingView: UIView {

    //MARK: - Creating UI Elements
    
    private lazy var grabberView = CustomGrabberView()

 
    lazy var pharmacyTableView: UITableView = {
        let table = UITableView()
        table.translatesAutoresizingMaskIntoConstraints = false
        table.register(PharmacyTableViewCell.self, forCellReuseIdentifier: PharmacyTableViewCell.identifier)
        table.allowsSelection = false
        table.backgroundColor = .white.withAlphaComponent(0.92)
        return table
    }()
    
    lazy var headerView: PharmacyTableViewHeader = {
        let header = PharmacyTableViewHeader(frame: CGRect(x: 0, y: 0, width: bounds.width, height: 84))
        
        return header
    }()
    
    //MARK: - Init Methods
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white.withAlphaComponent(0.92)
        addSubview(grabberView)
        makeTableView()
        //Constaints
        setUpConstraints()
        
        
    }
    
    private func makeTableView() {
        addSubview(pharmacyTableView)
        pharmacyTableView.tableHeaderView = headerView
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
     
    }
    
    private func setUpConstraints() {
        
        NSLayoutConstraint.activate([
            grabberView.topAnchor.constraint(equalTo: topAnchor, constant: 6),
            grabberView.centerXAnchor.constraint(equalTo: centerXAnchor),
            grabberView.heightAnchor.constraint(equalToConstant: 3),
            grabberView.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width / 3),
            
            pharmacyTableView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 4),
            pharmacyTableView.topAnchor.constraint(equalTo: grabberView.bottomAnchor, constant: 4),
            pharmacyTableView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -4),
            pharmacyTableView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    

}


