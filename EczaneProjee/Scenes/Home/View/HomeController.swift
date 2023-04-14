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
        configureViewController()
    }
    
    //MARK: - Configure View Controller
    private func configureViewController() {
        self.setupHideKeyboardWhenTapOutside()
        createReactives()
    }
    
}

//MARK: - Create Reactives

extension HomeController {
    
    private func createReactives() {
        setReactiveSearchTextField()
        setReactiveTableView()
        viewModel.getCities()
    }
    
    private func setReactiveSearchTextField() {
        homeView.searchTextField.rx.text.changed.subscribe { [weak self] text in
            guard let self = self, let text = text else { return }
            self.viewModel.filterCities(text)
        }.disposed(by: disposeBag)
        
        homeView.searchTextField.rx.controlEvent(.touchDown).subscribe { [weak self] _ in
            guard let self = self else { return }
            self.homeView.makeTableViewAnimation()
        }.disposed(by: disposeBag)
    }
    
    private func setReactiveTableView() {
        
        viewModel.cityList.bind(to: homeView.citySelectionTableView.rx.items(cellIdentifier: CitySelectTableViewCell.identifier, cellType: CitySelectTableViewCell.self)) { row, city, cell in
            if let cityName = city.sehirAd {
                cell.textLabel?.text = cityName
            }
            
        }.disposed(by: disposeBag)
        
        homeView.citySelectionTableView.rx.itemSelected.subscribe { [weak self] indexpath in
            guard let cell = self?.homeView.citySelectionTableView.cellForRow(at: indexpath) as? CitySelectTableViewCell,
                  let citySlug = self?.viewModel.filteredCityList[indexpath.row].sehirSlug,
                  let cityName = self?.viewModel.filteredCityList[indexpath.row].sehirAd else { return }
            
            cell.animateBackgroundColor {
                self?.homeView.citySelectionTableView.deselectRow(at: indexpath, animated: true)
                self?.homeView.makeTableViewAnimation()
            }
            
            self?.homeView.searchTextField.text = cityName
            self?.viewModel.getCounties(citySlug)
            
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
