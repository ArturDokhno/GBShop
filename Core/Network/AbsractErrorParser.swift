//
//  AbsractErrorParser.swift
//  GBShop
//
//  Created by Артур Дохно on 22.03.2022.
//

import Foundation

protocol AbstractErrorParser {
    func parse(_ result: Error) -> Error
    func parse(response: HTTPURLResponse?, data: Data?, error: Error?) -> Error?
}
