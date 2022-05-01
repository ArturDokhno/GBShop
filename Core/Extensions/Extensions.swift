//
//  Extensions.swift
//  GBShop
//
//  Created by Артур Дохно on 01.05.2022.
//

import Foundation

extension Int {
    var formattedString: String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.maximumFractionDigits = 2
        formatter.locale = Locale(identifier: "RU")
        
        let number = NSNumber(value: self)
        let formattedValue = formatter.string(from: number)!
        return "\(formattedValue)"
    }
}
