//
//  Endpoint.swift
//  EczaneProjee
//
//  Created by Mac on 13.04.2023.
//

import Foundation
import Alamofire

protocol EndPoint {
    var apiKey: String { get }
    var httpMethod: String { get }
    var baseURL: String { get }
    var path: String { get }
    var body: [String: Any]? { get }
}

extension EndPoint {
    var url: String {
        return baseURL + path 
    }
}
