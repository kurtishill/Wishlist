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
    
    @Binding var showSearchView: Bool
    @Binding var modalSelection: ModalSelection
    @Binding var listNeedsRefresh: Bool
    
    var body: some View {
        ZStack {
            GridView(items: self.myWishlistVM.wishlist!.items, gridViewDelegate: self.myWishlistVM)
            BottomFab {
                self.modalSelection = .search
                self.showSearchView = true
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
