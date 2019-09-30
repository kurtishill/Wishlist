//
//  YourWishlistViewModel.swift
//  Wishlist
//
//  Created by Kurtis Hill on 9/28/19.
//  Copyright © 2019 Kurtis Hill. All rights reserved.
//

import Foundation
import Combine

class YourWishlistViewModel: ObservableObject {
    @Published var isLoadingList: Bool = false
    @Published var wishlist: [Item] = [Item]()
    
    init() {
        isLoadingList = true
    }
}
