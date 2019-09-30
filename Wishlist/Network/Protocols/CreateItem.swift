//
//  CreateItem.swift
//  Wishlist
//
//  Created by Kurtis Hill on 9/28/19.
//  Copyright © 2019 Kurtis Hill. All rights reserved.
//

import Foundation

protocol CreateItemNetworkProtocol {
    func createItem(ref: String, for list: String) throws -> Item
}
