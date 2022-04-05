//
//  RequestTests.swift
//  GBShopTests
//
//  Created by Артур Дохно on 05.04.2022.
//

import XCTest
@testable import GBShop

class RequestTests: XCTestCase {
    
    let timeout = 10.0
    
    var requestFactory: RequestFactory!
    var user: User!
    
    let expectation = XCTestExpectation(description: "Perform request")
    
    override func setUpWithError() throws {
        try? super.setUpWithError()
        requestFactory = RequestFactory()
        user = User(id: 123,
                    login: "Somebody",
                    password: "mypassword",
                    email: "some@some.ru",
                    gender: "m",
                    creditCard: "9872389-2424-234224-23",
                    bio: "This is good! I think I will switch to another language",
                    name: "John",
                    lastname: "Doe")
    }
    
    override func tearDownWithError() throws {
        try? super.tearDownWithError()
        requestFactory = nil
        user = nil
    }
    
    func testPerfomrSignupResuest() {
        let factory = requestFactory.makeSignupRequestFactory()
        
        factory.signup(user: user) { response in
            switch response.result {
            case .success(let result): XCTAssertEqual(result.result, 1)
            case .failure: XCTFail()
            }
            self.expectation.fulfill()
        }
        wait(for: [expectation], timeout: timeout)
    }
    
    func testPerformAuthRequest() {
        let factory = requestFactory.makeAuthRequestFactory()
        
        factory.login(user: user) { response in
            switch response.result {
            case .success(let result): XCTAssertEqual(result.result, 1)
            case .failure: XCTFail()
            }
            self.expectation.fulfill()
        }
        wait(for: [expectation], timeout: timeout)
    }
    
    func testPerformLogoutRequest() {
        let factory = requestFactory.makeAuthRequestFactory()
        
        factory.logout(user: user) { response in
            switch response.result {
            case .success(let result): XCTAssertEqual(result.result, 1)
            case .failure: XCTFail()
            }
            self.expectation.fulfill()
        }
        wait(for: [expectation], timeout: timeout)
    }
    
    func testPerformChangeUserDataRequest() {
        let factory = requestFactory.makeChangeUserDataRequestFactory()
        
        factory.changeUserData(user: user) { response in
            switch response.result {
            case .success(let result): XCTAssertEqual(result.result, 1)
            case .failure: XCTFail()
            }
            self.expectation.fulfill()
        }
        wait(for: [expectation], timeout: timeout)
    }
    
    func testPerformGetCatalogRequest() {
        let factory = requestFactory.makeGetCatalogRequestFactory()
        
        factory.getCatalog(pageNumber: 1, categotyId: 1) { response in
            switch response.result {
            case .success: break
            case .failure: XCTFail()
            }
            self.expectation.fulfill()
        }
        wait(for: [expectation], timeout: timeout)
    }
    
    func testPerformGetGoodsRequest() {
        let factory = requestFactory.makeGetGoodsRequestFactory()
        
        factory.getGoods(productId: 123) { response in
            switch response.result {
            case .success(let result): XCTAssertEqual(result.result, 1)
            case .failure: XCTFail()
            }
            self.expectation.fulfill()
        }
        wait(for: [expectation], timeout: timeout)
    }
}
