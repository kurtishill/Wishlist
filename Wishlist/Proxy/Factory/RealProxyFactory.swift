//
//  RealProxyFacade.swift
//  Wishlist
//
//  Created by Kurtis Hill on 10/21/19.
//  Copyright © 2019 Kurtis Hill. All rights reserved.
//

import Foundation

class RealProxyFactory: ProxyFactoryProtocol {
    let ip: String
    let port: String
    
    init(ip: String, port: String) {
        self.ip = ip
        self.port = port
    }
    
    func createLoginProxy() -> LoginProxyProtocol {
        return LoginProxy()
    }
    
    func createSignUpProxy() -> SignUpProxyProtocol {
        return SignUpProxy()
    }
    
    func createSearchProxy() -> SearchProxyProtocol {
        return SearchProxy(ip: ip, port: port)
    }
    
    
}
