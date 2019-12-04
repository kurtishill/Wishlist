//
//  ShareView.swift
//  Wishlist
//
//  Created by Kara Crowder on 12/2/19.
//  Copyright © 2019 Kurtis Hill. All rights reserved.
//

import SwiftUI

struct ShareView: View {
    var onDismiss: () -> Void
    var wishlist: Wishlist
    
    @State private var usernameToShareWith: String = ""
    @ObservedObject private var shareVM: ShareViewModel = ShareViewModel()
    
    var body: some View {
        VStack(spacing: 20) {
            Text("Who do you want to share \"\(self.wishlist.listName)\" with?")
                .font(.custom(AssetsFonts.primaryFont, size: 25))
            TextField("username of recipient", text: self.$usernameToShareWith)
                .frame(height: 50)
                .padding(.leading, 10)
                .background(Color.gray.opacity(0.2))
                .cornerRadius(10)
                .font(.custom(AssetsFonts.primaryFont, size: 15))
                .foregroundColor(.black)
            Button(action: {
                print("dismissing")
                self.onDismiss()
                self.shareVM.share(self.wishlist.id, with: self.usernameToShareWith)
            }) {
                RoundedRectangle(cornerRadius: 10)
                    .frame(height: 50)
                    .foregroundColor(AssetColors.accentColor)
                    .shadow(radius: 4)
                    .overlay(Text("Share")
                        .foregroundColor(.white)
                        .font(.custom(AssetsFonts.primaryFont, size: 20))
                )
            }
            Spacer()
        }.padding(.init(top: 60, leading: 20, bottom: 60, trailing: 20))
    }
}

//struct ShareView_Previews: PreviewProvider {
//    static var previews: some View {
//        ShareView(onDismiss: {})
//    }
//}
