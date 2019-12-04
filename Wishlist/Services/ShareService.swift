//
//  ShareService.swift
//  Wishlist
//
//  Created by Kurtis Hill on 12/2/19.
//  Copyright © 2019 Kurtis Hill. All rights reserved.
//

import Foundation

class ShareService {
    let proxy: ProxyProtocol = ProxyFactory.createServerProxy()
    
    func share(_ wishlist: String, with username: String, owner: String) -> Bool? {
        do {
            let success = try proxy.share(wishlist, with: username, owner: owner)
            return success
        } catch {
            print("Error: ", error)
            return nil
        }
    }
}
