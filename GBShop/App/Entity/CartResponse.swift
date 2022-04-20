//
//  CartResponse.swift
//  GBShop
//
//  Created by Артур Дохно on 20.04.2022.
//

import Foundation

struct CartResponse: Codable {
    var amount: Int?
    var count: Int?
    var content: [CartContents]
}

struct CartContents: Codable {
    var productId: Int?
    var productName: String?
    var productPrice: Int?
    var quantity: Int?
}
