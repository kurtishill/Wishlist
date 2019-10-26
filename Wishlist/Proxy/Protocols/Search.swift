//
//  Search.swift
//  Wishlist
//
//  Created by Kurtis Hill on 10/10/19.
//  Copyright © 2019 Kurtis Hill. All rights reserved.
//

import Foundation

protocol SearchProxyProtocol {
    func search(keyword: String) throws -> SearchResponse
}
