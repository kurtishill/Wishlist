//
//  SharedWishlistViewModel.swift
//  Wishlist
//
//  Created by Kurtis Hill on 12/2/19.
//  Copyright © 2019 Kurtis Hill. All rights reserved.
//

import Foundation

class SharedWishlistViewModel: ObservableObject, GridViewSelectDelegate {
    var wishlist: Wishlist?
    
    init(wishlist: Wishlist) {
        self.wishlist = wishlist
    }
    
    func favoriteTapped(for item: Item) {
        print("")
    }
    
    func isItemFavorited(_ item: Item) -> Bool {
        return false
    }
}
