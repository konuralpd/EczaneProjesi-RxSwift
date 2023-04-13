//
//  HomeController.swift
//  EczaneProjee
//
//  Created by Ekrem Alkan on 13.04.2023.
//

import UIKit
import FloatingPanel
import RxSwift
import RxCocoa

final class HomeController: UIViewController {
    
    private lazy var homeView = HomeView()
    
    private lazy var floationgPanel = FloatingPanelController()
    
    private let disposeBag = DisposeBag()
    
    //MARK: - Life Cycle Methods
    override func loadView() {
        super.loadView()
        view = homeView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupHideKeyboardWhenTapOutside()
        createFloatingPanel()
    }
    
}

//MARK: - Configure Floating Panel
extension HomeController {
    
    private func createFloatingPanel() {
        floationgPanel.surfaceView.backgroundColor = .white
        floationgPanel.set(contentViewController: UIViewController())
        floationgPanel.addPanel(toParent: self)
        floationgPanel.move(to: .half, animated: true)
    }
    
}
