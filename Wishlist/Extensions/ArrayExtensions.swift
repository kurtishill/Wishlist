//
//  ArrayExtensions.swift
//  Wishlist
//
//  Created by Kurtis Hill on 9/29/19.
//  Copyright © 2019 Kurtis Hill. All rights reserved.
//

import Foundation

extension Array {
    func chunked(into size: Int) -> [[Element]] {
        return stride(from: 0, to: count, by: size).map {
            Array(self[$0..<Swift.min($0 + size, count)])
        }
    }
}
