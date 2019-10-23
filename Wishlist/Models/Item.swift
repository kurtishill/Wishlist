//
//  Item.swift
//  Wishlist
//
//  Created by Kurtis Hill on 9/28/19.
//  Copyright © 2019 Kurtis Hill. All rights reserved.
//

import Foundation

struct Item: Identifiable, Hashable, Decodable {
    let id: String
    let name: String
    let price: Double
    let photo: String
    let url: String
}
