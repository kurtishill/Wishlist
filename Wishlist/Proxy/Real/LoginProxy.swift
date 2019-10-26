//
//  Login.swift
//  Wishlist
//
//  Created by Kurtis Hill on 10/21/19.
//  Copyright © 2019 Kurtis Hill. All rights reserved.
//

import Foundation
import Alamofire

class LoginProxy: LoginProxyProtocol {
    func login(username: String, password: String) throws -> User {
        return User(username: "", name: "", birthdate: "")
//        return try! Request<User>.send(url: "",
//                                       method: "post",
//                                       params: ["username": username,
//                                                "password": password]
//        )
    }
}
