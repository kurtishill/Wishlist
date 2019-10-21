//
//  SignInService.swift
//  Wishlist
//
//  Created by Kurtis Hill on 9/28/19.
//  Copyright © 2019 Kurtis Hill. All rights reserved.
//

import Foundation

class LoginService {
    let loginProxy: LoginProxyProtocol = ProxyFactory.createLoginProxy()
    
    func login(username: String, password: String) -> User? {
        do {
            let user = try loginProxy.login(username: username, password: password)
            return user
        } catch {
            print("Error: ", error)
            return nil
        }
    }
}
