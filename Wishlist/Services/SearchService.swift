//
//  SearchService.swift
//  Wishlist
//
//  Created by Kurtis Hill on 10/10/19.
//  Copyright © 2019 Kurtis Hill. All rights reserved.
//

import Foundation

class SearchService {
    let searchProxy: SearchProxyProtocol = ProxyFactory.createSearchProxy()
    
    func search(for keyword: String) -> [Item]? {
        do {
            let searchResponse: SearchResponse = try searchProxy.search(keyword: keyword)
            let items = searchResponse.searchResults
            return items
        } catch {
            print("Error: ", error)
            return nil
        }
    }
}
