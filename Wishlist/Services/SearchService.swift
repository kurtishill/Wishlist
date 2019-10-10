//
//  SearchService.swift
//  Wishlist
//
//  Created by Kurtis Hill on 10/10/19.
//  Copyright © 2019 Kurtis Hill. All rights reserved.
//

import Foundation

class SearchService {
    let searchNetwork: SearchNetworkProtocol
    
    init(searchNetwork: SearchNetworkProtocol) {
        self.searchNetwork = searchNetwork
    }
    
    func search(for keyword: String) -> [Item]? {
        do {
            let items = try searchNetwork.search(keyword: keyword)
            return items
        } catch {
            print("Error: ", error)
            return nil
        }
    }
}
