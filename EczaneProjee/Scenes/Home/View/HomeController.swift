//
//  HomeController.swift
//  EczaneProjee
//
//  Created by Ekrem Alkan on 13.04.2023.
//

import UIKit

final class HomeController: UIViewController {
    
    private lazy var homeView = HomeView()
    
    //MARK: - Life Cycle Methods
    override func loadView() {
        super.loadView()
        view = homeView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupHideKeyboardWhenTapOutside()
    }
    
}
