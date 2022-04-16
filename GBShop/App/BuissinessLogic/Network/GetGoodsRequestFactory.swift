//
//  GetGoodsRequestFactory.swift
//  GBShop
//
//  Created by Артур Дохно on 05.04.2022.
//

import Foundation
import Alamofire

protocol GetGoodsRequestFactory {
    func getGood(productId: Int, completionHandler: @escaping (AFDataResponse<GoodResponse>) -> Void)
}
