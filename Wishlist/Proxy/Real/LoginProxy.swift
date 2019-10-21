//
//  Login.swift
//  Wishlist
//
//  Created by Kurtis Hill on 10/21/19.
//  Copyright © 2019 Kurtis Hill. All rights reserved.
//

import Foundation

class LoginProxy: LoginProxyProtocol {
    func login(username: String, password: String) throws -> User {
        return User(username: "", name: "", birthdate: "")
    }
}
