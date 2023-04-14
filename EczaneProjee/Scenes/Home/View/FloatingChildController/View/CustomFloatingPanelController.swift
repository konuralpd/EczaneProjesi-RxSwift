//
//  CustomFloatingPanelController.swift
//  EczaneProjee
//
//  Created by Ekrem Alkan on 13.04.2023.
//

import UIKit
import RxSwift
import RxCocoa

final class CustomFloatingPanelController: UIViewController {
    
    let customView = CustomFloatingView()
    
    private let disposeBag = DisposeBag()
    var viewModel: FloatingPanelViewModel?
    
    var cancelButtonTapped: Observable<Void> {
        return self.customView.headerView.cancelButton.rx.tap.asObservable()
    }
    
    init(viewModel: FloatingPanelViewModel? = nil) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func loadView() {
        super.loadView()
        self.view = customView
      
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        configureViewController()
    }
    
    private func configureViewController() {
        setViewModelReactive()
        setReactiveFloatingTableView()
        guard let viewModel = viewModel else { return }
        viewModel.getPharmacyList(viewModel.selectedCity, viewModel.selectedCounty)
    }
    
    
 
}

//MARK: - Creating Reactives

extension CustomFloatingPanelController {
    
    private func setReactiveFloatingTableView() {
        viewModel?.pharmacyList.bind(to: customView.pharmacyTableView.rx.items(cellIdentifier: PharmacyTableViewCell.identifier, cellType: PharmacyTableViewCell.self)) { row,pharmacy,cell in
            cell.setWithData(pharmacy)
            
        }.disposed(by: disposeBag)
        
        customView.pharmacyTableView.rowHeight = 120
    }
    
    private func setViewModelReactive() {
        viewModel?.pharmacyList.subscribe(onNext: { [weak self] pharmacyList in
            guard let self = self else { return }
            let header = customView.headerView
            header.cityLabel.text = viewModel?.selectedCity.localizedCapitalized
            header.pharmacyCountLabel.text = "\(pharmacyList.count) adet eczane nöbetçi"
        }).disposed(by: disposeBag)
    }
}
