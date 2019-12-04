//
//  MenuViewModel.swift
//  Wishlist
//
//  Created by Kurtis Hill on 11/29/19.
//  Copyright © 2019 Kurtis Hill. All rights reserved.
//

import Foundation

class MenuViewModel: ObservableObject {
    let getMyWishlistService = GetMyWishlistService()
    let getSharedWishlistsService = GetSharedWishlistsService()
    
    @Published var myWishlists: [Wishlist] = []
    @Published var sharedWishlists: [Wishlist] = []
    
    @Published var myWishlistLoading: Bool = false
    @Published var sharedWishlistsLoading: Bool = false
    
    @Published var selectedWishlist: Wishlist?
    @Published var isSelectedWishlistMine: Bool = true
    
    let userState: UserState = UserState.instance
    
    func fetchAllLists() {
        fetchMyWishlists()
        fetchSharedWishlists()
    }
    
    func fetchMyWishlists(autoSelect: Bool = false) {
        guard let username = userState.user?.name else { return }
        
        self.myWishlistLoading = true
        
        DispatchQueue.global(qos: .background).async {
            let myWishlist = self.getMyWishlistService.getList(for: username)
            DispatchQueue.main.async {
                self.myWishlistLoading = false
                guard let wishlist = myWishlist else { return }
                self.myWishlists = [wishlist]
                
                if autoSelect {
                    self.selectedWishlist = self.myWishlists.first!
                }
            }
        }
    }
    
    func fetchSharedWishlists() {
        guard let username = userState.user?.name else { return }
        
        self.sharedWishlistsLoading = true
        
        DispatchQueue.global(qos: .background).async {
            let sharedWishlists = self.getSharedWishlistsService.getSharedLists(for: username)
            DispatchQueue.main.async {
                self.sharedWishlistsLoading = false
                guard let wishlists = sharedWishlists else { return }
                self.sharedWishlists = wishlists
            }
        }
    }
}
