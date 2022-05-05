//
//  Goods.swift
//  GBShop
//
//  Created by Артур Дохно on 05.04.2022.
//

import Foundation

struct GoodResponse: Codable {
    let result: Int?
    let productId: Int?
    let productName: String?
    let price: Int?
    let description: String?
    let picUrl: String?
}
