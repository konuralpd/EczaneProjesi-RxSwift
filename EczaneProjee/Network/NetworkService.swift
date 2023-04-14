//
//  NetworkService.swift
//  EczaneProjee
//
//  Created by Mac on 13.04.2023.
//

import Foundation
import RxSwift

protocol ServiceProtocol {
    func getCities() -> Observable<CityModel?>
    func getCounties(_ city: String) -> Observable<CountyModel?>

}

final class NetworkService: ServiceProtocol {
    static let shared = NetworkService()
    
    func getCities() -> Observable<CityModel?> {
        return NetworkManager.shared.request(path: EndPointCases.getCities.url)
    }
    
    func getCounties(_ city: String) -> Observable<CountyModel?> {
        return NetworkManager.shared.request(path: EndPointCases.getCounties(city).url)
    }
    
}
