//
//  SignUpService.swift
//  Wishlist
//
//  Created by Kurtis Hill on 9/28/19.
//  Copyright © 2019 Kurtis Hill. All rights reserved.
//

import Foundation

class SignUpService {
    let signUpProxy: SignUpProxyProtocol = ProxyFactory.createSignUpProxy()
    
    func signUp(username: String, password: String, name: String, birthdate: String) -> User? {
        do {
            let user = try signUpProxy.signUp(username: username, password: password, name: name, birthdate: birthdate)
            return user
        } catch {
            print("Error: ", error)
            return nil
        }
    }
}
