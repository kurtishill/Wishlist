//
//  YourWishlistView.swift
//  Wishlist
//
//  Created by Kurtis Hill on 9/28/19.
//  Copyright © 2019 Kurtis Hill. All rights reserved.
//

import SwiftUI

struct YourWishlistView: View {
    @ObservedObject var yourWishlistVM: YourWishlistViewModel = YourWishlistViewModel()
    
    var body: some View {
        ZStack {
            GridView()
            BottomFab()
        }
    }
}

//struct YourWishlistView_Previews: PreviewProvider {
//    static var previews: some View {
//        YourWishlistView()
//    }
//}
