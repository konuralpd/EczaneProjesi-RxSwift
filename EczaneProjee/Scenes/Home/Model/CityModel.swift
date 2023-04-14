//
//  CityModel.swift
//  EczaneProjee
//
//  Created by Mac on 13.04.2023.
//

import Foundation

// MARK: - CityModel
struct CityModel: Codable {
    var status, message: String?
    var systemTime, rowCount: Int?
    var data: [City]?
}

// MARK: - CityParameters
struct City: Codable {
    var sehirAd, sehirSlug: String?

    enum CodingKeys: String, CodingKey {
        case sehirAd = "SehirAd"
        case sehirSlug = "SehirSlug"
    }
}




