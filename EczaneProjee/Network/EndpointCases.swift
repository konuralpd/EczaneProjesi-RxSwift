//
//  EndpointCases.swift
//  EczaneProjee
//
//  Created by Mac on 13.04.2023.
//

import Foundation
import Alamofire

enum EndPointCases: EndPoint {
    case getCities
    
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
        }
    }
    
    var headers: Alamofire.HTTPHeaders? {
        return [.authorization(bearerToken: NetworkConstants.apiToken)]
    }
    
    var body: [String : Any]? {
        return [:]
    }
    
    
}
