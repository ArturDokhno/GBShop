//
//  AuthRequestFactory.swift
//  GBShop
//
//  Created by Артур Дохно on 23.03.2022.
//

import Foundation
import Alamofire

protocol AuthRequestFactory {
    func login(userName: String,
               password: String,
               cpmpletionHanler: @escaping (AFDataResponse<LoginResult>) -> Void)
}

