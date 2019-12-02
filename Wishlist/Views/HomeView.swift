//
//  ContentView.swift
//  Wishlist
//
//  Created by Kurtis Hill on 9/26/19.
//  Copyright © 2019 Kurtis Hill. All rights reserved.
//

import SwiftUI

struct HomeView: View {
    @State var menuOpen: Bool = false
	@State private var showShareSheet = false
    
    @ObservedObject var menuVM: MenuViewModel = MenuViewModel()
    
    var menuButton: some View {
        Button(action: {
            self.toggleMenu()
        }) {
            Image("menu")
                .resizable()
                .frame(width: 20, height: 20)
                .foregroundColor(.black)
        }
    }
    
    var shareButton: some View {
        Button(action: {
            self.showShareSheet = true
        }) {
            Image(systemName: "square.and.arrow.up")
                .foregroundColor(.black)
        }
    }
    
    var body: some View {
        ZStack {
            VStack {
                Group {
                    HStack {
                        menuButton
                        Spacer()
                        Text(self.menuVM.selectedWishlist?.listName ?? "Wishlist")
                            .font(.custom(AssetsFonts.primaryFont, size: 20))
                        Spacer()
                        shareButton
                    }.padding(.trailing, 20)
                        .padding(.leading, 20)
                    Divider()
                        .offset(y: 10)
                }
                Group {
                    if self.menuVM.isSelectedWishlistMine {
                        MyWishlistView(myWishlistVM: MyWishlistViewModel(wishlist: self.menuVM.selectedWishlist ?? Wishlist(id: "-1", listName: "", items: [])))
                    } else {
                        SharedWishlistView(sharedWishlistVM: SharedWishlistViewModel(wishlist: self.menuVM.selectedWishlist ?? Wishlist(id: "-1", listName: "", items: [])))
                    }
                }.frame(minWidth: 0,
                        maxWidth: UIScreen.main.bounds.width,
                        minHeight: 0,
                        maxHeight: UIScreen.main.bounds.height
                )
                    .offset(y: 7.5)
            }.navigationBarHidden(true)
                .navigationBarBackButtonHidden(true)
                .navigationBarTitle("")
                .edgesIgnoringSafeArea(.all)
                .padding(.top, 20)
            
            SideMenu(width: UIScreen.main.bounds.width * (3/4), isOpen: self.$menuOpen, menuClose: self.toggleMenu, menuVM: self.menuVM)
        }.onAppear {
            self.menuVM.fetchMyWishlists(autoSelect: true)
        }
//		.sheet(isPresented: $showShareSheet) {
//			ShareSheet(activityItems: [URL(string:"http://www.wishlist.com/myWishlist")])
//		}
		.sheet(isPresented: $showShareSheet) {
			ShareView(onDismiss: {
				self.showShareSheet = false
			})
		}
    }
    
    func toggleMenu() {
        self.menuOpen.toggle()
    }
}

//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        HomeView()
//    }
//}
