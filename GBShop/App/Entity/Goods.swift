//
//  Goods.swift
//  GBShop
//
//  Created by Артур Дохно on 05.04.2022.
//

import Foundation

struct Goods: Codable {
    let result: Int?
    let price: Int?
    let description: String?
    
    enum CodingKeys: String, CodingKey {
        case result
        case price = "product_price"
        case description = "product_description"
    }
}
