//
//  SearchService.swift
//  Wishlist
//
//  Created by Kurtis Hill on 10/10/19.
//  Copyright © 2019 Kurtis Hill. All rights reserved.
//

import Foundation

class SearchService {
    let proxy: ProxyProtocol = ProxyFactory.createServerProxy()
    
    func search(for keyword: String) -> [Item]? {
        do {
            let searchResponse: SearchResponse = try proxy.search(keyword: keyword)
            let items = searchResponse.searchResults
            return items
        } catch {
            print("Error: ", error)
            return nil
        }
    }
}
