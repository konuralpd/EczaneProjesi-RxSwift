//
//  HomeViewModel.swift
//  EczaneProjee
//
//  Created by Mac on 13.04.2023.
//

import Foundation
import RxSwift
import RxRelay


final class HomeViewModel {
    let disposedBag = DisposeBag()
    
    public var cityList = PublishSubject<[City]>()
    
    public var countyList = PublishSubject<[County]>()
    var arrayCityList = [City]()
    var filteredCityList = [City]()

    func getCities() {
        NetworkService.shared.getCities().subscribe { [weak self] event in
            guard let self = self else { return }
            switch event {
            case .next(let cities):
                if let cities = cities?.data {
                    self.cityList.onNext(cities)
                    self.filteredCityList = cities
                    self.arrayCityList = cities
                }
            case .error(let error):
                print(error.localizedDescription)
            case .completed:
                print("Success")
            }
        }.disposed(by: disposedBag)
    }
    
    func filterCities(_ character: String) {
        let filteredCities = arrayCityList.filter({ $0.sehirAd!.lowercased().hasPrefix(character.lowercased())})
        self.filteredCityList = filteredCities
        self.cityList.onNext(filteredCities)
    }
    
    
    func getCounties(_ city: String) {
        NetworkService.shared.getCounties(city).subscribe { [weak self] event in
            guard let self = self else { return }
            switch event {
            case .next(let counties):
                if let counties = counties?.data {
                    self.countyList.onNext(counties)
                }
            case .error(let error):
                print(error.localizedDescription)
            case .completed:
                print("success counties")
            }
        }.disposed(by: disposedBag)
    }
}
