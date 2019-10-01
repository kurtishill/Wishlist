//
//  ContentView.swift
//  Wishlist
//
//  Created by Kurtis Hill on 9/26/19.
//  Copyright © 2019 Kurtis Hill. All rights reserved.
//

import SwiftUI

struct HomeView: View {
    var menuButton: some View {
        Button(action: {
            
        }) {
            Image("menu")
                .resizable()
                .foregroundColor(.black)
                .frame(width: 20, height: 20)
        }
    }
    
    var shareButton: some View {
        Button(action: {
            
        }) {
            Image(systemName: "square.and.arrow.up")
                .foregroundColor(.black)
        }
    }
    
    var body: some View {
        VStack {
            Group {
                HStack {
                    menuButton
                    Spacer()
                    Text("Wishlist")
                        .font(.custom(AssetsFonts.primaryFont, size: 20))
                    Spacer()
                    shareButton
                }.padding(.trailing, 20)
                    .padding(.leading, 20)
                Divider()
                    .offset(y: 10)
            }
            YourWishlistView()
                .frame(minWidth: 0, maxWidth: UIScreen.main.bounds.width, minHeight: 0, maxHeight: UIScreen.main.bounds.height)
                .offset(y: 7.5)
        }.navigationBarHidden(true)
            .navigationBarBackButtonHidden(true)
            .navigationBarTitle("")
            .edgesIgnoringSafeArea(.all)
            .padding(.top, 20)
    }
}

//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        HomeView()
//    }
//}
