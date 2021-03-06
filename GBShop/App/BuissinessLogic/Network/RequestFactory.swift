//
//  RequestFactory.swift
//  GBShop
//
//  Created by Артур Дохно on 24.03.2022.
//

import Foundation
import Alamofire

class RequestFactory {
    
    func makeErrorParser() -> AbstractErrorParser {
        return ErrorParser()
    }
    
    lazy var commonSession: Session = {
        let configuration = URLSessionConfiguration.default
        configuration.httpShouldSetCookies = false
        configuration.headers = .default
        let manager = Session(configuration: configuration)
        return manager
    }()
    
    let sessionQueue = DispatchQueue.global(qos: .utility)
    
    func makeAuthRequestFactory() -> AuthRequestFactory {
        let errorParser = makeErrorParser()
        return Auth(errorParser: errorParser, sessionManager: commonSession, queue: sessionQueue)
    }
    
    func makeSignupRequestFactory() -> SignupRequestFactory {
        let errorParser = makeErrorParser()
        return Signup(errorParser: errorParser, sessionManager: commonSession, queue: sessionQueue)
    }
    
    func makeChangeUserDataRequestFactory() -> ChangeUserDataRequestFactory {
        let errorParser = makeErrorParser()
        return ChangeUserData(errorParser: errorParser, sessionManager: commonSession, queue: sessionQueue)
    }
    
    func makeGetCatalogRequestFactory() -> GetCatalogRequestFactory {
        let errorParser = makeErrorParser()
        return GetCatalog(errorParser: errorParser, sessionManager: commonSession, queue: sessionQueue)
    }
    
    func makeGetGoodRequestFactory() -> GetGoodRequestFactory {
        let errorParser = makeErrorParser()
        return GetGood(errorParser: errorParser, sessionManager: commonSession, queue: sessionQueue)
    }
    
    func makeReviewsRequestFactory() -> ReviewRequestFactory {
        let errorParser = makeErrorParser()
        return Reviews(errorParser: errorParser, sessionManager: commonSession, queue: sessionQueue)
    }
    
    func makeCartRequestFactory() -> CartRequestFactory {
        let errorParser = makeErrorParser()
        return Cart(errorParser: errorParser, sessionManager: commonSession, queue: sessionQueue)
    }
}

