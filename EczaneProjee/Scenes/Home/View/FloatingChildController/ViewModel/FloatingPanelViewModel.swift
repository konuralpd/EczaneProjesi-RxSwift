//
//  FloatingPanelViewModel.swift
//  EczaneProjee
//
//  Created by Mac on 14.04.2023.
//

import Foundation
import RxSwift


final class FloatingPanelViewModel {
    let disposedBag = DisposeBag()
    public var pharmacyList = PublishSubject<[Pharmacy]>()
    public var arrayPharmacyList = [Pharmacy]()
    
    var selectedCity: String
    var selectedCounty: String
    
    init(selectedCity: String, selectedCounty:String) {
        self.selectedCity = selectedCity
        self.selectedCounty = selectedCounty
    }
    
    
    func getPharmacyList(_ city: String,_ county: String) {
        NetworkService.shared.getPharmacyList(city, county).subscribe { [weak self] event in
            guard let self = self else { return }
            switch event {
            case .next(let pharmacyList):
                if let list = pharmacyList?.data {
                    self.pharmacyList.onNext(list)
                    self.arrayPharmacyList = list
                }
            case .error(let error):
                print(error.localizedDescription)
            case .completed:
                print("success pharmacy list")
            }
        }.disposed(by: disposedBag)
    }
}
