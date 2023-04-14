//
//  PharmacyModel.swift
//  EczaneProjee
//
//  Created by Mac on 14.04.2023.
//

import Foundation

// MARK: - PharmacyModel
struct PharmacyModel: Codable {
    let status, message: String
    let rowCount: Int
    let data: [Pharmacy]
}

// MARK: - Datum
struct Pharmacy: Codable {
    let eczaneAdi, adresi, semt: String
    let telefon: String
    let sehir, ilce: String
    let latitude, longitude: Double

    enum CodingKeys: String, CodingKey {
        case eczaneAdi = "EczaneAdi"
        case adresi = "Adresi"
        case semt = "Semt"
        case telefon = "Telefon"
        case sehir = "Sehir"
        case ilce, latitude, longitude
    }
}

