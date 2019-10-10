//
//  GridItemView.swift
//  Wishlist
//
//  Created by Kurtis Hill on 9/27/19.
//  Copyright © 2019 Kurtis Hill. All rights reserved.
//

import SwiftUI

struct GridItemView: View {
    var item: Item
    var gridWidth: CGFloat
    var gridHeight: CGFloat
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 7)
                .frame(width: self.gridWidth, height: self.gridHeight)
                .foregroundColor(.white)
                .shadow(color: Color("lightBlue"), radius: 8, x: 0, y: 0)
            GeometryReader { geometry in
                VStack {
//                    HStack {
//                        Spacer()
//                        Image(systemName: "heart.fill")
//                            .resizable()
//                            .frame(width: 20, height: 20)
//                            .foregroundColor(Color("salmon"))
//                    }
                    
                    Spacer()
                    
                    Image(systemName: "gift.fill")
                        .resizable()
                        .frame(minWidth: 0, maxWidth: geometry.size.width - 80, minHeight: 0, maxHeight: geometry.size.height - 100)
                        .foregroundColor(Color("dullYellow"))
                    
                    HStack {
                        VStack(alignment: .leading) {
                            Spacer()
                            Text(self.item.name)
                                .font(.custom(AssetsFonts.primaryFont, size: 25))
                                .minimumScaleFactor(0.5)
                            Text("$\(self.item.price)")
                                .font(.custom(AssetsFonts.primaryFont, size: 15))
                                .foregroundColor(.gray)
                                .minimumScaleFactor(0.5)
                            Spacer()
                        }
                        
                        Spacer()
                        
//                        Image(systemName: "checkmark.circle.fill")
//                            .resizable()
//                            .frame(width: 20, height: 20)
//                            .foregroundColor(Color("darkDullBlue"))
                    }
                }.padding(.all, 15)
            }
        }.offset(x: 2.5, y: 0)
            .offset(x: -2.5, y: 0)
    }
}

//struct GridItemView_Previews: PreviewProvider {
//    static var previews: some View {
//        GridItemView()
//    }
//}
