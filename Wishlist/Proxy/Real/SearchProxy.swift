//
//  Search.swift
//  Wishlist
//
//  Created by Kurtis Hill on 10/21/19.
//  Copyright © 2019 Kurtis Hill. All rights reserved.
//

import Foundation
import Alamofire

class SearchProxy: SearchProxyProtocol {
    func search(keyword: String) throws -> [Item] {
        return try! Request<[Item]>.send(url: "", method: "get")
    }
}
