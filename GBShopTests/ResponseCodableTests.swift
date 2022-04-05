//
//  ResponseCodableTests.swift
//  GBShopTests
//
//  Created by Артур Дохно on 01.04.2022.
//

import XCTest
import Alamofire
@testable import GBShop

class ResponseCodableTests: XCTestCase {
    
    let expectation = XCTestExpectation(description: "Download https://jsonplaceholder.typicode.com/posts/1")
    var errorParser: ErrorParserStub!
    
    struct PostStub: Codable {
        let userId: Int
        let id: Int
        let title: String
        let body: String
    }
    
    enum ApiErrortub: Error {
        case fatalError
    }
    
    struct ErrorParserStub: AbstractErrorParser {
        func parse(_ result: Error) -> Error {
            return ApiErrortub.fatalError
        }
        
        func parse(response: HTTPURLResponse?, data: Data?, error: Error?) -> Error? {
            return error
        }
    }
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        errorParser = ErrorParserStub()
    }
    
    override func tearDownWithError() throws {
        try super.tearDownWithError()
        errorParser = nil
    }
    
    func testShouldDownloadAndParse() {
        AF
            .request("https://jsonplaceholder.typicode.com/posts/1")
            .responseCodable(errorParser: errorParser) { [weak self] (response: DataResponse<PostStub, AFError>) in
                switch response.result {
                case .success(_): break
                case .failure: XCTFail()
                }
                self?.expectation.fulfill()
            }
        wait(for: [expectation], timeout: 10.0)
    }
}
