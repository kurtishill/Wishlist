//
//  AddItemsService.swift
//  Wishlist
//
//  Created by Kurtis Hill on 10/30/19.
//  Copyright © 2019 Kurtis Hill. All rights reserved.
//

import Foundation

class AddItemsService {
    let proxy: ProxyProtocol = ProxyFactory.createServerProxy()
    
    func addItems(items: [Item], for list: String) -> Bool {
        let items = items.map { (item: Item) -> Item in
            var i = item
            i.listId = list
            return i
        }
        
        do {
            let success = try proxy.addItems(items: items, for: list)
            return success
        } catch {
            print("Error: ", error)
            return false
        }
    }
}
