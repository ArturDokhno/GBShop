//
//  ReviewRequest.swift
//  GBShop
//
//  Created by Артур Дохно on 16.04.2022.
//

import Foundation

struct ReviewRequest: Codable {
    let reviewText: String?
    let userId: Int?
    let productId: Int?
}
