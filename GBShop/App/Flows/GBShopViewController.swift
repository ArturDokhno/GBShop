//
//  GBShopViewController.swift
//  GBShop
//
//  Created by Артур Дохно on 24.03.2022.
//

import UIKit

class GBShopViewController: UIViewController {
    
    let requestFactory = RequestFactory()

    override func viewDidLoad() {
        super.viewDidLoad()

        makeAuthRequest()
        makeLogoutRequest()
    }
    
    func makeAuthRequest() {
        let factory = requestFactory.makeAuthRequestFactory()
        let user = User(login: "Somebody", password: "mypassword")
        
        factory.login(user: user) { response in
            switch response.result {
            case .success(let result):
                print(result)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    func makeLogoutRequest() {
        let factory = requestFactory.makeAuthRequestFactory()
        let user = User(id: 123)
        
        factory.logout(user: user) { response in
            switch response.result {
            case .success(let result):
                print(result)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}
