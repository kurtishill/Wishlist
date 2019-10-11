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
    
    @State var showSearchView: Bool = false
    
    var body: some View {
        ZStack {
            GridView(items: [], gridViewDelegate: self.yourWishlistVM)
            BottomFab {
                self.showSearchView.toggle()
            }.sheet(isPresented: self.$showSearchView) {
                SearchView()
            }
        }
    }
}

//struct YourWishlistView_Previews: PreviewProvider {
//    static var previews: some View {
//        YourWishlistView()
//    }
//}
