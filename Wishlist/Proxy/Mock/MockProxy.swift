//
//  MockProxy.swift
//  Wishlist
//
//  Created by Kurtis Hill on 10/31/19.
//  Copyright © 2019 Kurtis Hill. All rights reserved.
//

import Foundation

class MockProxy: ProxyProtocol {
    func login(username: String, password: String) throws -> User {
        let s = DispatchSemaphore(value: 0)
        _ = s.wait(timeout: .now() + 1.0)
        return MockData.users.authenticatedUser
    }
    
    func signUp(username: String, password: String, name: String, birthdate: String) throws -> User {
        let s = DispatchSemaphore(value: 0)
        _ = s.wait(timeout: .now() + 1.0)
        return MockData.users.authenticatedUser
    }
    
    func search(keyword: String) throws -> SearchResponse {
        let s = DispatchSemaphore(value: 0)
        _ = s.wait(timeout: .now() + 1.0)
        let searchResponse = SearchResponse(searchResults: MockData.items.mockItems())
        return searchResponse
    }
    
    func addItems(items: [Item], for list: String) throws -> Bool {
        let s = DispatchSemaphore(value: 0)
        _ = s.wait(timeout: .now() + 1.0)
        return true
    }
    
    func getMyList(_ username: String) throws -> Wishlist {
        let s = DispatchSemaphore(value: 0)
        _ = s.wait(timeout: .now() + 1.0)
        return Wishlist(id: "0", listName: "My list", items: [])
    }
    
    func getSharedLists(_ username: String) throws -> [Wishlist] {
        let s = DispatchSemaphore(value: 0)
        _ = s.wait(timeout: .now() + 1.2)
        return [
            Wishlist(id: "1", listName: "Someone's list 1", items: []),
            Wishlist(id: "2", listName: "Someone's list 2", items: [])
        ]
    }
    
    func share(_ wishlist: String, with username: String, owner: String) throws -> Bool {
        let s = DispatchSemaphore(value: 0)
        _ = s.wait(timeout: .now() + 1.0)
        return true
    }
}
