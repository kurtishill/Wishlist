//
//  SignUpService.swift
//  Wishlist
//
//  Created by Kurtis Hill on 9/28/19.
//  Copyright © 2019 Kurtis Hill. All rights reserved.
//

import Foundation

class SignUpService {
    let proxy: ProxyProtocol = ProxyFactory.createServerProxy()
    
    func signUp(username: String, password: String, name: String, birthdate: String) -> User? {
        do {
            let user = try proxy.signUp(username: username, password: password, name: name, birthdate: birthdate)
            UserState.instance.authenticate(user: user)
            return user
        } catch {
            print("Error: ", error)
            return nil
        }
    }
}
