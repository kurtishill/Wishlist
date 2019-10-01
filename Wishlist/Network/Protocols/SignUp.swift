//
//  SignUp.swift
//  Wishlist
//
//  Created by Kurtis Hill on 10/1/19.
//  Copyright © 2019 Kurtis Hill. All rights reserved.
//

import Foundation

protocol SignUpNetworkProtocol {
    func signUp(username: String, password: String, name: String, birthdate: String) throws -> User
}
