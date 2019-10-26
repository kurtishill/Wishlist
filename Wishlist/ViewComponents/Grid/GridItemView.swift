//
//  GridItemView.swift
//  Wishlist
//
//  Created by Kurtis Hill on 9/27/19.
//  Copyright © 2019 Kurtis Hill. All rights reserved.
//

import SwiftUI
import URLImage

let priceFormatter: NumberFormatter = {
    let nf = NumberFormatter()
    nf.locale = .current
    nf.numberStyle = .currency
    return nf
}()

struct GridItemView<T: GridViewSelectDelegate>: View {
    var item: Item
    var gridWidth: CGFloat
    var gridHeight: CGFloat
    @ObservedObject var gridViewDelegate: T
    
    @State var pulse: Bool = false
    
    let duration = 0.15
    
    private var animation: Animation {
        Animation.easeIn(duration: duration)
    }
    
    private var timer: Timer {
        Timer.scheduledTimer(withTimeInterval: duration, repeats: false) { _ in
            self.pulse.toggle()
        }
    }
    
    var body: some View {
        VStack {
            RoundedRectangle(cornerRadius: 7)
                .frame(width: self.gridWidth, height: self.gridHeight)
                .foregroundColor(.white)
                .animation(.spring())
                .shadow(color: Color("lightBlue"), radius: 8, x: 0, y: 0)
                .overlay(
            GeometryReader { geometry in
                VStack {
                    ZStack {
                        
                        URLImage(
                            self.item.photo.url,
                            placeholder: { _ in
                                LoadingIndicator()
                            },
                            content: { proxy in
                                proxy.image
                                    .resizable()
                                    .cornerRadius(7)
                                
                        })
                        
                        VStack {
                            HStack {
                                Spacer()
                                Image(systemName: self.gridViewDelegate.isItemFavorited(self.item) ? "heart.fill" : "heart")
                                    .resizable()
                                    .frame(width: 22, height: 22)
                                    .scaleEffect(self.pulse ? 1.5 : 1)
                                    .animation(self.animation)
                                    .foregroundColor(AssetColors.accentColor)
                                    .animation(.spring())
                                    .shadow(radius: 3)
                                    .onTapGesture {
                                        self.pulse.toggle()
                                        _ = self.timer
                                        self.gridViewDelegate.favoriteTapped(for: self.item)
                                }
                            }.padding(.trailing, 15)
                                .padding(.top, 15)
                            
                            Spacer()
                        }
                    }
                    
                    HStack {
                        VStack(alignment: .leading) {
                            Spacer()
                            Text(self.item.productName)
                                .font(.custom(AssetsFonts.primaryFont, size: 20))
                                .foregroundColor(.black)
                                .minimumScaleFactor(0.8)
                            Text(priceFormatter.string(from: self.item.price as NSNumber)!)
                                .font(.custom(AssetsFonts.primaryFont, size: 15))
                                .foregroundColor(.gray)
                                .animation(.spring())
                                .minimumScaleFactor(0.8)
                            Spacer()
                        }
                        
                        Spacer()
                        
                        Button(action: {
                            
                        }) {
                            Image(systemName: "info.circle.fill")
                                .resizable()
                                .frame(width: 20, height: 20)
                                .foregroundColor(AssetColors.primaryColor)
                        }
                    }.padding(.leading, 15)
                        .padding(.trailing, 15)
                }
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
