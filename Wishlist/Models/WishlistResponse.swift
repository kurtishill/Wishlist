//
//  WishlistResponse.swift
//  Wishlist
//
//  Created by Kurtis Hill on 12/1/19.
//  Copyright © 2019 Kurtis Hill. All rights reserved.
//

import Foundation

struct WishlistResponse: Decodable {
    let wishlists: [Wishlist]
}
