//
//  SideMenu.swift
//  Wishlist
//
//  Created by Kurtis Hill on 10/11/19.
//  Copyright © 2019 Kurtis Hill. All rights reserved.
//

import SwiftUI

struct SideMenu: View {
    let width: CGFloat
    @Binding var isOpen: Bool
    let menuClose: () -> Void
    
    @ObservedObject var menuVM: MenuViewModel
    
    var body: some View {
        ZStack {
            GeometryReader { _ in
                EmptyView()
            }
            .background(Color.gray.opacity(0.3))
            .opacity(self.isOpen ? 1.0 : 0.0)
            .animation(.spring())
            .onTapGesture {
                self.menuClose()
            }
            
            HStack {
                MenuContent(menuVM: self.menuVM)
                    .frame(width: self.width)
                    .background(Color.white)
                    .offset(x: self.isOpen ? 0 : -self.width)
                    .animation(.spring())
                
                Spacer()
            }
        }.onAppear {
            self.menuVM.fetchMyWishlists()
            self.menuVM.fetchSharedWishlists()
        }
    }
}

struct MenuContent: View {
    @ObservedObject var menuVM: MenuViewModel
    
    var body: some View {
        VStack(spacing: 7) {
            HStack {
                Text("Your Lists")
                    .font(.custom(AssetsFonts.primaryFont, size: 20))
                Spacer()
            }
            Divider()
            if self.menuVM.myWishlistLoading {
                LoadingIndicator()
            } else {
                ForEach(self.menuVM.myWishlists) { (wishlist: Wishlist) in
                    HStack {
                        Text(wishlist.listName)
                            .font(.custom(AssetsFonts.primaryFont, size: 17))
                            .foregroundColor(self.menuVM.selectedWishlist?.id == wishlist.id ? .white : .black)
                            .padding(.leading, 1)
                            .padding(.top, 2)
                            .padding(.bottom, 2)
                        Spacer()
                    }.background(self.menuVM.selectedWishlist?.id == wishlist.id ? AssetColors.primaryColor : Color.white)
                        .cornerRadius(5)
                        .onTapGesture {
                            self.menuVM.selectedWishlist = wishlist
                            self.menuVM.isSelectedWishlistMine = true
                    }
                }
            }
            Group {
                HStack {
                    Text("Shared With You")
                        .font(.custom(AssetsFonts.primaryFont, size: 20))
                    Spacer()
                }
                Divider()
                if self.menuVM.sharedWishlistsLoading {
                    LoadingIndicator()
                } else {
                    ForEach(self.menuVM.sharedWishlists) { (wishlist: Wishlist) in
                        HStack {
                            Text(wishlist.listName)
                                .font(.custom(AssetsFonts.primaryFont, size: 17))
                                .foregroundColor(self.menuVM.selectedWishlist?.id == wishlist.id ? .white : .black)
                                .padding(.leading, 1)
                                .padding(.top, 2)
                                .padding(.bottom, 2)
                            Spacer()
                        }.background(self.menuVM.selectedWishlist?.id == wishlist.id ? AssetColors.primaryColor : Color.white)
                            .cornerRadius(5)
                            .onTapGesture {
                                self.menuVM.selectedWishlist = wishlist
                                self.menuVM.isSelectedWishlistMine = false
                        }
                    }
                }
            }.offset(y: 20)
            Spacer()
        }.padding(.leading, 10)
            .padding(.trailing, 10)
    }
}

//struct SideMenu_Previews: PreviewProvider {
//    static var previews: some View {
//        SideMenu()
//    }
//}
