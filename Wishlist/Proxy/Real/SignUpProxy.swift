//
//  SignUp.swift
//  Wishlist
//
//  Created by Kurtis Hill on 10/21/19.
//  Copyright © 2019 Kurtis Hill. All rights reserved.
//

import Foundation

class SignUpProxy: SignUpProxyProtocol {
    func signUp(username: String, password: String, name: String, birthdate: String) throws -> User {
        return User(username: "", name: "", birthdate: "")
    }
}
