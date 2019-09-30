//
//  BottomFab.swift
//  Wishlist
//
//  Created by Kurtis Hill on 9/28/19.
//  Copyright © 2019 Kurtis Hill. All rights reserved.
//

import SwiftUI

struct BottomFab: View {
    var body: some View {
        VStack {
            Spacer()
            HStack {
                Spacer()
                Button(action: {
                    
                }) {
                    Circle()
                        .frame(width: 70, height: 70)
                        .foregroundColor(.white)
                        .shadow(color: AssetColors.lightPrimaryColor, radius: 8, x: 0, y: 0)
                        .overlay(
                            Image(systemName: "plus")
                                .resizable()
                                .frame(width: 25, height: 25)
                                .foregroundColor(AssetColors.primaryColor), alignment: .center
                    )
                }
            }
        }.padding(.trailing, 20)
            .padding(.bottom, 20)
    }
}

//struct BottomFab_Previews: PreviewProvider {
//    static var previews: some View {
//        BottomFab()
//    }
//}
