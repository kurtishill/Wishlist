//
//  YourWishlistViewModel.swift
//  Wishlist
//
//  Created by Kurtis Hill on 9/28/19.
//  Copyright © 2019 Kurtis Hill. All rights reserved.
//

import Foundation
import Combine

class YourWishlistViewModel: ObservableObject, GridViewSelectDelegate {
    @Published var isLoadingList: Bool = false
    @Published var wishlist: Wishlist = Wishlist(id: "", listName: "", items: [])
    
    func favoriteTapped(for item: Item) {
        
    }
    
    func isItemFavorited(_ item: Item) -> Bool {
        return true
    }
}
