//
//  proxy.swift
//  Wishlist
//
//  Created by Kurtis Hill on 10/31/19.
//  Copyright © 2019 Kurtis Hill. All rights reserved.
//

import Foundation

protocol ProxyProtocol {
    func login(username: String, password: String) throws -> User
    func signUp(username: String, password: String, name: String, birthdate: String) throws -> User
    func search(keyword: String) throws -> SearchResponse
    func addItems(items: [Item], for list: String) throws -> Bool
    func getMyList(_ username: String) throws -> Wishlist
    func getSharedLists(_ username: String) throws -> [Wishlist]
}
