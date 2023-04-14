//
//  CitySelectTableViewCell.swift
//  EczaneProjee
//
//  Created by Mac on 13.04.2023.
//

import UIKit

class CitySelectTableViewCell: UITableViewCell {
    
    static let identifier = "CitySelectTableViewCell"
 
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
    }
    
    func animateBackgroundColor(onCompleted: @escaping () -> Void) {
        let animation = CATransition()
        animation.timingFunction = CAMediaTimingFunction(name: .easeInEaseOut)
        animation.type = .fade
        animation.duration = 0.05
        let bgColorView = UIView()
        bgColorView.backgroundColor = UIColor.systemRed
        selectedBackgroundView = bgColorView
        
        self.layer.add(animation, forKey: "changeTextTransition")
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.05) {
            onCompleted()
        }
    }
}
