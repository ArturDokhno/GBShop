//
//  Catalog.swift
//  GBShop
//
//  Created by Артур Дохно on 05.04.2022.
//

import Foundation

struct CatalogResponse: Codable {
    let productId: Int?
    let productName: String?
    let price: Int?
}
