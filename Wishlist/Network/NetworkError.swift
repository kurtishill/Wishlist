//
//  NetworkError.swift
//  Wishlist
//
//  Created by Kurtis Hill on 9/28/19.
//  Copyright © 2019 Kurtis Hill. All rights reserved.
//

import Foundation

enum NetworkError: Error {
    case url
    case statusCode
    case other
}
