//
//  GridItemView.swift
//  Wishlist
//
//  Created by Kurtis Hill on 9/27/19.
//  Copyright © 2019 Kurtis Hill. All rights reserved.
//

import SwiftUI

let priceFormatter: NumberFormatter = {
    let nf = NumberFormatter()
    nf.locale = .current
    nf.numberStyle = .currency
    return nf
}()

struct GridItemView: View {
    var item: Item
    var gridWidth: CGFloat
    var gridHeight: CGFloat
    var isItemSelected: Bool?
    
    var body: some View {
        VStack {
            RoundedRectangle(cornerRadius: 7)
                .frame(width: self.gridWidth, height: self.gridHeight)
                .foregroundColor(self.isItemSelected ?? false ? AssetColors.accentColor : .white)
                .animation(.spring())
                .shadow(color: Color("lightBlue"), radius: 8, x: 0, y: 0)
                .overlay(
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
                        .foregroundColor(AssetColors.warningColor)
                    
                    HStack {
                        VStack(alignment: .leading) {
                            Spacer()
                            Text(self.item.name)
                                .font(.custom(AssetsFonts.primaryFont, size: 25))
                                .foregroundColor(.black)
                                .minimumScaleFactor(0.8)
                            Text(priceFormatter.string(from: self.item.price as NSNumber)!)
                                .font(.custom(AssetsFonts.primaryFont, size: 15))
                                .foregroundColor(self.isItemSelected ?? false ? .white : .gray)
                                .animation(.spring())
                                .minimumScaleFactor(0.8)
                            Spacer()
                        }
                        
                        Spacer()
                        
//                        Image(systemName: "checkmark.circle.fill")
//                            .resizable()
//                            .frame(width: 20, height: 20)
//                            .foregroundColor(Color("darkDullBlue"))
                    }
                }.padding(.all, 15)
            })
        }.offset(x: 2.5, y: 0)
            .offset(x: -2.5, y: 0)
    }
}

//struct GridItemView_Previews: PreviewProvider {
//    static var previews: some View {
//        GridItemView()
//    }
//}
