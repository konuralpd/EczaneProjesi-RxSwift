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
        }
    }
    
    var body: [String : Any]? {
        return [:]
    }
    
    
}
