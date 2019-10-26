//
//  StringExtensions.swift
//  Wishlist
//
//  Created by Kurtis Hill on 10/26/19.
//  Copyright © 2019 Kurtis Hill. All rights reserved.
//

import Foundation

extension String {
    var url: URL {
        if let urlValue = URL(string:self) {
            return urlValue
        }
        
        fatalError("Unable to convert URL to string")
    }
}
