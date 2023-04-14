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
    weak var viewModel: FloatingPanelViewModel?
    
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
        setReactiveFloatingTableView()
      
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        guard let viewModel = viewModel else { return }
        viewModel.getPharmacyList(viewModel.selectedCity, viewModel.selectedCounty)
    }
    
    private func setReactiveFloatingTableView() {
        viewModel?.pharmacyList.bind(to: customView.pharmacyTableView.rx.items(cellIdentifier: PharmacyTableViewCell.identifier, cellType: PharmacyTableViewCell.self)) { row,pharmacy,cell in
            cell.setWithData(pharmacy)
        }.disposed(by: disposeBag)
    }
    


}
