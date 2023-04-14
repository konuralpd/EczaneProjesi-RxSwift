//
//  CustomFloatingPanelController.swift
//  EczaneProjee
//
//  Created by Ekrem Alkan on 13.04.2023.
//

import UIKit

final class CustomFloatingPanelController: UIViewController {
    
    let customView = CustomFloatingView()
    

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
        guard let viewModel = viewModel else { return }
        viewModel.getPharmacyList(viewModel.selectedCity, viewModel.selectedCounty)
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    


}
