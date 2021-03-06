//
//  AuthRequestFactory.swift
//  GBShop
//
//  Created by Артур Дохно on 23.03.2022.
//

import Foundation
import Alamofire

protocol AuthRequestFactory {
    func login(user: User, completionHandler: @escaping (AFDataResponse<DefaultResponse>) -> Void)
    func logout(user: User, completionHandler: @escaping (AFDataResponse<DefaultResponse>) -> Void)
}

