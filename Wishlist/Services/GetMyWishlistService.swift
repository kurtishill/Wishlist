//
//  GetMyWishlistService.swift
//  Wishlist
//
//  Created by Kurtis Hill on 12/1/19.
//  Copyright © 2019 Kurtis Hill. All rights reserved.
//

import Foundation

class GetMyWishlistService {
    let proxy: ProxyProtocol = ProxyFactory.createServerProxy()
    
    func getList(for username: String) -> Wishlist? {
        do {
            let wishlist = try proxy.getMyList(username)
            return wishlist
        } catch {
            print("Error: ", error)
            return nil
        }
    }
}
