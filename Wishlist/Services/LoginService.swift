//
//  SignInService.swift
//  Wishlist
//
//  Created by Kurtis Hill on 9/28/19.
//  Copyright © 2019 Kurtis Hill. All rights reserved.
//

import Foundation

class LoginService {
    let proxy: ProxyProtocol = ProxyFactory.createServerProxy()
    
    func login(username: String, password: String) -> User? {
        do {
            let user = try proxy.login(username: username, password: password)
            UserState.instance.authenticate(user: user)
            return user
        } catch {
            print("Error: ", error)
            return nil
        }
    }
}
