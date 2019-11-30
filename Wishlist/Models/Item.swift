//
//  Item.swift
//  Wishlist
//
//  Created by Kurtis Hill on 9/28/19.
//  Copyright © 2019 Kurtis Hill. All rights reserved.
//

import Foundation

struct Item: Identifiable, Hashable, Codable {
    let id: String
    var listID: String = "0"
    let productName: String
    let price: Double
    let photo: String
    let url: String
}
