//
//  MockData.swift
//  Wishlist
//
//  Created by Kurtis Hill on 9/28/19.
//  Copyright © 2019 Kurtis Hill. All rights reserved.
//

import Foundation

class MockData {
    static let users = Users()
    static let items = Items()
}

class Users {
    let authenticatedUser = User(username: "user1", name: "Bob", birthdate: "12/25/1990")
}

class Items {
    func createRandomItem() -> Item {
        return Item(
            id: UUID().uuidString,
            productName: "Gift \(Int.random(in: 0..<100))",
            price: Double.random(in: 0..<1000).rounded(),
            photo: "",
            url: ""
        )
    }
    
    func mockItems() -> [Item] {
        return [Item(id: "1", productName: "Gift 1", price: 150.00, photo: "", url: ""),
        Item(id: "2", productName: "Gift 2", price: 200.00, photo: "", url: ""),
        Item(id: "3", productName: "Gift 3", price: 100.00, photo: "", url: ""),
        Item(id: "4", productName: "Gift 4", price: 50.00, photo: "", url: ""),
        Item(id: "5", productName: "Gift 5", price: 75.00, photo: "", url: "")]
    }
}
