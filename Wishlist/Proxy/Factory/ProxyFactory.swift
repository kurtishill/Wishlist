//
//  ProxyFacade.swift
//  Wishlist
//
//  Created by Kurtis Hill on 10/21/19.
//  Copyright © 2019 Kurtis Hill. All rights reserved.
//

import Foundation

class ProxyFactory {
    static var instance: ProxyFactoryProtocol?
    
    // this must be called in scene delegate
    static func configure(factory: ProxyFactoryProtocol) {
        instance = factory
    }
    
    static func createLoginProxy() -> LoginProxyProtocol {
        return instance!.createLoginProxy()
    }
    
    static func createSignUpProxy() -> SignUpProxyProtocol {
        return instance!.createSignUpProxy()
    }
    
    static func createSearchProxy() -> SearchProxyProtocol {
        return instance!.createSearchProxy()
    }
}
