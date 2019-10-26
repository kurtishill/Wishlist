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
    let ip: String
    let port: String
    
    init(ip: String, port: String) {
        self.ip = ip
        self.port = port
    }
    
    func search(keyword: String) throws -> SearchResponse {
        do {
            return try Request<SearchResponse>.send(url: "http://\(self.ip):\(self.port)/search", method: "post", params: ["searchQuery": keyword])
        } catch {
            throw error
        }
    }
}
