//
//  MockSearch.swift
//  Wishlist
//
//  Created by Kurtis Hill on 10/10/19.
//  Copyright © 2019 Kurtis Hill. All rights reserved.
//

import Foundation

class MockSearch: SearchNetworkProtocol {
    func search(keyword: String) throws -> [Item] {
        let s = DispatchSemaphore(value: 0)
        _ = s.wait(timeout: .now() + 1.0)
        return MockData.items.mockItems()
    }
}
