//
//  CreateItemService.swift
//  Wishlist
//
//  Created by Kurtis Hill on 9/28/19.
//  Copyright © 2019 Kurtis Hill. All rights reserved.
//

import Foundation

class CreateItemService {
    let createItemNetwork: CreateItemNetworkProtocol
    
    init(createItemNetwork: CreateItemNetworkProtocol) {
        self.createItemNetwork = createItemNetwork
    }
    
    func createItem(ref: String, for list: String) -> Item? {
        do {
            let item = try createItemNetwork.createItem(ref: ref, for: list)
            return item
        } catch {
            print("Error: ", error)
            return nil
        }
    }
}
