//
//  GetSharedWishlistsService.swift
//  Wishlist
//
//  Created by Kurtis Hill on 12/2/19.
//  Copyright © 2019 Kurtis Hill. All rights reserved.
//

import Foundation

class GetSharedWishlistsService {
    let proxy: ProxyProtocol = ProxyFactory.createServerProxy()
    
    func getSharedLists(for username: String) -> [Wishlist]? {
        do {
            let wishlists = try proxy.getSharedLists(username)
            return wishlists
        } catch {
            print("Error: ", error)
            return nil
        }
    }
}
