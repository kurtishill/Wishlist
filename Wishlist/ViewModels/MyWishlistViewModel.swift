//
//  YourWishlistViewModel.swift
//  Wishlist
//
//  Created by Kurtis Hill on 9/28/19.
//  Copyright © 2019 Kurtis Hill. All rights reserved.
//

import Foundation
import Combine

class MyWishlistViewModel: ObservableObject, GridViewSelectDelegate {
    var wishlist: Wishlist?
    
    init(wishlist: Wishlist) {
        self.wishlist = wishlist
    }
    
    func favoriteTapped(for item: Item) {
        
    }
    
    func isItemFavorited(_ item: Item) -> Bool {
        return true
    }
}
