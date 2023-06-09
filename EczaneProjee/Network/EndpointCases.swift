//
//  EndpointCases.swift
//  EczaneProjee
//
//  Created by Mac on 13.04.2023.
//

import Foundation

enum EndPointCases: EndPoint {
    case getCities
    case getCounties(String)
    case getPharmacy(String, String)
    
    var apiKey: String {
        return ""
    }
    
    var httpMethod: String {
        return "GET"
    }
    
    var baseURL: String {
        return NetworkConstants.apiURL
    }
    
    var path: String {
        switch self {
        case .getCities:
            return "/city?"
        case .getCounties(let city):
            return "/city?city=\(city)"
        case .getPharmacy(let city, let county):
            return "?city=\(city)&county=\(county)"
        }
    }
    
    var body: [String : Any]? {
        return [:]
    }
    
    
}
