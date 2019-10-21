//
//  MockProxyFacade.swift
//  Wishlist
//
//  Created by Kurtis Hill on 10/21/19.
//  Copyright © 2019 Kurtis Hill. All rights reserved.
//

import Foundation

class MockProxyFactory: ProxyFactoryProtocol {
    func createLoginProxy() -> LoginProxyProtocol {
        return MockLoginProxy()
    }
    
    func createSignUpProxy() -> SignUpProxyProtocol {
        return MockSignUpProxy()
    }
    
    func createSearchProxy() -> SearchProxyProtocol {
        return MockSearchProxy()
    }
}
