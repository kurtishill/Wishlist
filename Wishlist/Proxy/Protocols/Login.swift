//
//  SignIn.swift
//  Wishlist
//
//  Created by Kurtis Hill on 9/28/19.
//  Copyright © 2019 Kurtis Hill. All rights reserved.
//

import Foundation

protocol LoginProxyProtocol {
    func login(username: String, password: String) throws -> User
}
