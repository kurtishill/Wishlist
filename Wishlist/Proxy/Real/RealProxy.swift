//
//  RealProxy.swift
//  Wishlist
//
//  Created by Kurtis Hill on 10/31/19.
//  Copyright © 2019 Kurtis Hill. All rights reserved.
//

import Foundation

class RealProxy: ProxyProtocol {
    let ip: String
    let port: String
    
    init(ip: String, port: String) {
        self.ip = ip
        self.port = port
    }
    
    func login(username: String, password: String) throws -> User {
        return User(username: "", name: "", birthdate: "")
//        return try! Request<User>.send(url: "",
//                                       method: "post",
//                                       params: ["username": username,
//                                                "password": password]
//        )
    }
    
    func signUp(username: String, password: String, name: String, birthdate: String) throws -> User {
        return User(username: "", name: "", birthdate: "")
//        return try! Request<User>.send(url: "http://www.google.com",
//                                       method: "post",
//                                       params: ["username": username,
//                                                "password": password,
//                                                "name": name,
//                                                "birthdate": birthdate]
//        )
        
    }
    
    func search(keyword: String) throws -> SearchResponse {
        do {
            return try Request<String, SearchResponse>.send(
                url: "http://\(self.ip):\(self.port)/search",
                method: "post",
                params: ["searchQuery": keyword]
            )
        } catch {
            throw error
        }
    }
    
    func addItems(items: [Item], for list: String) throws -> Bool {
        do {
            let response = try Request<[Item], AddItemsResponse>.send(
                url: "http://\(self.ip):\(self.port)/addItem",
                method: "post",
                params: ["items": items]
            )
            return response.success
        } catch {
            throw error
        }
    }
    
    func getMyList(_ username: String) throws -> Wishlist {
        do {
            let response = try Request<String, WishlistResponse>.send(
                url: "http://\(self.ip):\(self.port)/getList",
                method: "post",
                params: ["username": username]
            )
            guard let wishlist = response.wishlists.first else {
                throw NetworkError.other
            }
            return wishlist
        } catch {
            throw error
        }
    }
    
    func getSharedLists(_ username: String) throws -> [Wishlist] {
        do {
            let response = try Request<String, WishlistResponse>.send(
                url: "http://\(self.ip):\(self.port)/getSharedLists",
                method: "post",
                params: ["username": username]
            )
            return response.wishlists
        } catch {
            throw error
        }
    }
}
