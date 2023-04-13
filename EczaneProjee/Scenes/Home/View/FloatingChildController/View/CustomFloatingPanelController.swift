//
//  CustomFloatingPanelController.swift
//  EczaneProjee
//
//  Created by Ekrem Alkan on 13.04.2023.
//

import UIKit

final class CustomFloatingPanelController: UIViewController {
    
    let customView = CustomFloatingView()
    
    override func loadView() {
        super.loadView()
        self.view = customView
    }

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    


}
