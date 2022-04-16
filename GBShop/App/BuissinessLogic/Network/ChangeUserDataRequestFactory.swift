//
//  ChangeUserDataRequestFactory.swift
//  GBShop
//
//  Created by Артур Дохно on 24.03.2022.
//

import Foundation
import Alamofire

protocol ChangeUserDataRequestFactory {
    func changeUserData(user: User, completionHandler: @escaping (AFDataResponse<DefaultResponse>) -> Void)
}
