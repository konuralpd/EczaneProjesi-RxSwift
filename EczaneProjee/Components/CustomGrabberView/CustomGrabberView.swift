//
//  CustomGrabberView.swift
//  EczaneProjee
//
//  Created by Ekrem Alkan on 13.04.2023.
//

import UIKit

 class CustomGrabberView: UIView {

     //MARK: - Init methods
     override init(frame: CGRect) {
         super.init(frame: frame)
         configureView()
     }
     
     required init?(coder: NSCoder) {
         fatalError("init(coder:) has not been implemented")
     }
     
     
     private func configureView() {
         self.translatesAutoresizingMaskIntoConstraints = false
         self.backgroundColor = .systemGray
         self.layer.cornerRadius = 1.5
         self.layer.masksToBounds = true
     }
     
    
}
