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
    func getPharmacyList(_ city: String,_ county: String) -> Observable<PharmacyModel?>

}

final class NetworkService: ServiceProtocol {
    static let shared = NetworkService()
    
    func getCities() -> Observable<CityModel?> {
        return NetworkManager.shared.request(path: EndPointCases.getCities.url)
    }
    
    func getCounties(_ city: String) -> Observable<CountyModel?> {
        return NetworkManager.shared.request(path: EndPointCases.getCounties(city).url)
    }
    
    func getPharmacyList(_ city: String, _ county: String) -> Observable<PharmacyModel?> {
        print(EndPointCases.getPharmacy(city, county).url)
        return NetworkManager.shared.request(path: EndPointCases.getPharmacy(city, county).url)
    }
}
