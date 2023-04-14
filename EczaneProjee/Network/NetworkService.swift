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
}

final class NetworkService: ServiceProtocol {
    static let shared = NetworkService()
    func getCities() -> Observable<CityModel?> {
        return NetworkManager.shared.request(path: EndPointCases.getCities.url)
    }
}
