//
//  SharedWishlistView.swift
//  Wishlist
//
//  Created by Kurtis Hill on 12/2/19.
//  Copyright © 2019 Kurtis Hill. All rights reserved.
//

import SwiftUI

struct SharedWishlistView: View {
    @ObservedObject var sharedWishlistVM: SharedWishlistViewModel
    
    var body: some View {
        ZStack {
            GridView(items: self.sharedWishlistVM.wishlist!.items, gridViewDelegate: self.sharedWishlistVM)
        }
    }
}

//struct SharedWishlistView_Previews: PreviewProvider {
//    static var previews: some View {
//        SharedWishlistView()
//    }
//}
