//
//  YourWishlistView.swift
//  Wishlist
//
//  Created by Kurtis Hill on 9/28/19.
//  Copyright © 2019 Kurtis Hill. All rights reserved.
//

import SwiftUI

struct MyWishlistView: View {
    @ObservedObject var myWishlistVM: MyWishlistViewModel
    
    @State var showSearchView: Bool = false
    
    @Binding var listNeedsRefresh: Bool
    
    var body: some View {
        ZStack {
            GridView(items: self.myWishlistVM.wishlist!.items, gridViewDelegate: self.myWishlistVM)
            BottomFab {
                self.showSearchView.toggle()
            }.sheet(isPresented: self.$showSearchView) {
                SearchView(listId: self.myWishlistVM.wishlist!.id, listNeedsRefresh: self.$listNeedsRefresh)
            }
        }
    }
}

//struct YourWishlistView_Previews: PreviewProvider {
//    static var previews: some View {
//        YourWishlistView()
//    }
//}
