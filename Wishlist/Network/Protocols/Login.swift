//
//  SignIn.swift
//  Wishlist
//
//  Created by Kurtis Hill on 9/28/19.
//  Copyright © 2019 Kurtis Hill. All rights reserved.
//

import Foundation

protocol LoginNetworkProtocol {
    func login(username: String, password: String) throws -> User
}
