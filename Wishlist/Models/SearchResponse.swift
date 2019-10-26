//
//  SearchResponse.swift
//  Wishlist
//
//  Created by Kurtis Hill on 10/26/19.
//  Copyright © 2019 Kurtis Hill. All rights reserved.
//

import Foundation

struct SearchResponse: Decodable {
    let searchResults: [Item]
}
