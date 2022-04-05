//
//  GetCatalogRequestFactory.swift
//  GBShop
//
//  Created by Артур Дохно on 05.04.2022.
//

import Foundation
import Alamofire

protocol GetCatalogRequestFactory {
    func getCatalog(pageNumber: Int, categotyId: Int, completionHandler: @escaping (AFDataResponse<[Catalog]>) -> Void)
}
