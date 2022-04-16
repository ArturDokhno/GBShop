//
//  SignupRequestFactory.swift
//  GBShop
//
//  Created by Артур Дохно on 24.03.2022.
//

import Foundation
import Alamofire

protocol SignupRequestFactory {
    func signup(user: User, completionHandler: @escaping (AFDataResponse<DefaultResponse>) -> Void)
}
