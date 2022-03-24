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
    }
    
    func makeAuthRequest() {
        let auth = requestFactory.makeAuthRequestFactory()
        auth.login(userName: "Somebody", password: "mypassword") { response in
            switch response.result {
            case .success(let result):
                print(result)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}
