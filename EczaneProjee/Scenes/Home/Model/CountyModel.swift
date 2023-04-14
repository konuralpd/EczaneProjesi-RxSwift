//
//  CountyModel.swift
//  EczaneProjee
//
//  Created by Ekrem Alkan on 14.04.2023.
//

import Foundation

// MARK: - CountyModel
struct CountyModel: Codable {
    let status, message: String?
    let systemTime, rowCount: Int?
    let data: [County]?
}

// MARK: - County
struct County: Codable {
    let ilceAd, ilceSlug: String?
}
