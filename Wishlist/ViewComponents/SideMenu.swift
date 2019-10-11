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
    let isOpen: Bool
    let menuClose: () -> Void
    
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
                MenuContent()
                    .frame(width: self.width)
                    .background(Color.white)
                    .offset(x: self.isOpen ? 0 : -self.width)
                    .animation(.spring())
                
                Spacer()
            }
        }
    }
}

struct MenuContent: View {
    var body: some View {
        List(0..<5) { _ in
            HStack(spacing: 15) {
                Image(systemName: "arrow.left")
                Text("Logout")
                    .font(.custom(AssetsFonts.primaryFont, size: 17))
            }
        }
    }
}

//struct SideMenu_Previews: PreviewProvider {
//    static var previews: some View {
//        SideMenu()
//    }
//}
