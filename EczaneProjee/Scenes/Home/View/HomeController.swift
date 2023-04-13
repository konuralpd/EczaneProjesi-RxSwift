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
    
    private lazy var viewModel = HomeViewModel()
    
    //MARK: - Life Cycle Methods
    override func loadView() {
        super.loadView()
        view = homeView
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupHideKeyboardWhenTapOutside()
        setReactiveSearchTextField()
        setReactiveTableView()
        viewModel.getCities()
        self.createFloatingPanel()
        
    }
    
    private func setReactiveSearchTextField() {
        homeView.searchTextField.rx.text.changed.subscribe { [weak self] text in
            guard let self = self else { return }
            print(text)
            self.homeView.makeTableViewAnimation()
            
        }.disposed(by: disposeBag)
    }
    
    private func setReactiveTableView() {
        viewModel.cityList.bind(to: homeView.citySelectionTableView.rx.items(cellIdentifier: CitySelectTableViewCell.identifier, cellType: CitySelectTableViewCell.self)) { index, city, cell in
            cell.textLabel?.text = city.sehirAd
        }.disposed(by: disposeBag)
        
        homeView.citySelectionTableView.rx.itemSelected.subscribe { indexpath in
            guard let cell = self.homeView.citySelectionTableView.cellForRow(at: indexpath) as? CitySelectTableViewCell else { return }
           //
        }.disposed(by: disposeBag)
    }
    
}

//MARK: - Configure Floating Panel
extension HomeController {
    
    private func createFloatingPanel() {
        floationgPanel.surfaceView.backgroundColor = .clear
        floationgPanel.isRemovalInteractionEnabled = false
        let customFloatingPanelController = CustomFloatingPanelController()
        floationgPanel.set(contentViewController: customFloatingPanelController)
        floationgPanel.addPanel(toParent: self)
        floationgPanel.move(to: .half, animated: true)
        
        //To Remove grabber from Floating Panel
        floationgPanel.surfaceView.subviews.forEach { view in
            guard let grabber = view as? GrabberView else { return }
            grabber.removeFromSuperview()
        }
    }
    
}
