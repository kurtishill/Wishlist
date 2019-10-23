//
//  User.swift
//  Wishlist
//
//  Created by Kurtis Hill on 9/28/19.
//  Copyright © 2019 Kurtis Hill. All rights reserved.
//

import Foundation

struct User: Decodable {
    let username: String
    let name: String
    let birthdate: String
}
