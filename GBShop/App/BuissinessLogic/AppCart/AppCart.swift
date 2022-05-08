//
//  AppCart.swift
//  GBShop
//
//  Created by Артур Дохно on 08.05.2022.
//

import Foundation

class AppCart {
    static let shared = AppCart()
    init(){}
    
    var items: [AppCartItem] = []
}

struct AppCartItem {
    let productId: Int?
    let productName: String?
    let price: Int?
    let picUrl: String?
}
