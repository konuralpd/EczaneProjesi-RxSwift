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
    func getCities() {
        NetworkService.shared.getCities().subscribe { evet in
            switch evet {
            case .next(let cities):
                if let cities = cities?.data {
                    self.cityList.onNext(cities)
                }
            case .error(let error):
                print(error)
            case .completed:
                print("Success")
            }
        }.disposed(by: disposedBag)
    }
}
