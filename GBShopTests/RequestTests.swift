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
    
    func testShouldPerformSignupRequest() {
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
    
    func testShouldPerformAuthRequest() {
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
    
    func testShouldPerformChangeUserDataRequest() {
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
    
    func testShouldPerformLogoutRequest() {
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
    
    func testShouldPerformGetCatalogRequest() {
        let factory = requestFactory.makeGetCatalogRequestFactory()
        
        factory.getCatalog(pageNumber: 1, categoryId: 1) { response in
            switch response.result {
            case .success: break
            case .failure: XCTFail()
            }
            self.expectation.fulfill()
        }
        wait(for: [expectation], timeout: timeout)
    }
    
    func testShouldPerformGetGoodRequest() {
        let factory = requestFactory.makeGetGoodsRequestFactory()
        
        factory.getGood(productId: 123) { response in
            switch response.result {
            case .success(let result): XCTAssertEqual(result.result, 1)
            case .failure: XCTFail()
            }
            self.expectation.fulfill()
        }
        wait(for: [expectation], timeout: timeout)
    }
    
    func testShouldPerformGetReviewsRequest() {
        let factory = requestFactory.makeReviewsRequestFactory()
        
        factory.getReviews(productId: 123) { response in
            switch response.result {
            case .success(let result): XCTAssertGreaterThan(result.count, 0)
            case .failure: XCTFail()
            }
            self.expectation.fulfill()
        }
        wait(for: [expectation], timeout: timeout)
    }
    
    func testShouldPerformAddReviewsRequest() {
        let factory = requestFactory.makeReviewsRequestFactory()
        
        factory.addReview(review: ReviewRequest(reviewText: "Товар говно!!!", userId: 123, productId: 666)) { response in
            switch response.result {
            case .success(let result): XCTAssertEqual(result.result, 1)
            case .failure: XCTFail()
            }
            self.expectation.fulfill()
        }
        wait(for: [expectation], timeout: timeout)
    }
    
    func testShouldPerformRemoveReviewsRequest() {
        let factory = requestFactory.makeReviewsRequestFactory()
        
        factory.removeReview(reviewId: 123) { response in
            switch response.result {
            case .success(let result): XCTAssertEqual(result.result, 1)
            case .failure: XCTFail()
            }
            self.expectation.fulfill()
        }
        wait(for: [expectation], timeout: timeout)
    }
    
    func testShouldPerformGetCartRequest() {
        let factory = requestFactory.makeCartRequestFactory()
        
        factory.getCart(user: User(id: 123)){ response in
            switch response.result {
            case .success(let result): XCTAssertNotNil(result.count)
            case .failure: XCTFail()
            }
            self.expectation.fulfill()
        }
        wait(for: [expectation], timeout: timeout)
    }
    
    func testShouldPerformPayCartRequest() {
        let factory = requestFactory.makeCartRequestFactory()
        
        factory.payCart(user: User(id: 123)){ response in
            switch response.result {
            case .success(let result): XCTAssertEqual(result.result, 1)
            case .failure: XCTFail()
            }
            self.expectation.fulfill()
        }
        wait(for: [expectation], timeout: timeout)
    }
    
    func testShouldPerformAddToCartRequest() {
        let factory = requestFactory.makeCartRequestFactory()
        
        factory.addToCart(cart: CartRequest(productId: 666, quantity: 1)){ response in
            switch response.result {
            case .success(let result): XCTAssertEqual(result.result, 1)
            case .failure: XCTFail()
            }
            self.expectation.fulfill()
        }
        wait(for: [expectation], timeout: timeout)
    }
    
    func testShouldPerformDeleteFromCartRequest() {
        let factory = requestFactory.makeCartRequestFactory()
        
        factory.deleteFromCart(cart: CartRequest(productId: 666)){ response in
            switch response.result {
            case .success(let result): XCTAssertEqual(result.result, 1)
            case .failure: XCTFail()
            }
            self.expectation.fulfill()
        }
        wait(for: [expectation], timeout: timeout)
    }
}
