//
//  DefaultResponse.swift
//  GBShop
//
//  Created by Артур Дохно on 16.04.2022.
//

import Foundation

struct DefaultResponse: Codable {
    var result: Int
    var successMessage: String?
    var errorMessage: String?
}
