//
//  Wishlist.swift
//  Wishlist
//
//  Created by Kurtis Hill on 9/29/19.
//  Copyright © 2019 Kurtis Hill. All rights reserved.
//

import Foundation

struct Wishlist: Identifiable {
    let id: String = UUID().uuidString
    let listName: String
    let items: [Item]
}
