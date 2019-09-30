//
//  MockCreateItem.swift
//  Wishlist
//
//  Created by Kurtis Hill on 9/28/19.
//  Copyright © 2019 Kurtis Hill. All rights reserved.
//

import Foundation

class MockCreateItem: CreateItemNetworkProtocol {
    func createItem(ref: String, for list: String) throws -> Item {
        let s = DispatchSemaphore(value: 0)
        _ = s.wait(timeout: .now() + 1.0)
        return MockData.items.createRandomItem()
    }
}
