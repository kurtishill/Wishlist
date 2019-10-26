//
//  MockSearch.swift
//  Wishlist
//
//  Created by Kurtis Hill on 10/10/19.
//  Copyright © 2019 Kurtis Hill. All rights reserved.
//

import Foundation

class MockSearchProxy: SearchProxyProtocol {
    func search(keyword: String) -> SearchResponse {
        let s = DispatchSemaphore(value: 0)
        _ = s.wait(timeout: .now() + 1.0)
        let searchResponse = SearchResponse(searchResults: MockData.items.mockItems())
        return searchResponse
    }
}
