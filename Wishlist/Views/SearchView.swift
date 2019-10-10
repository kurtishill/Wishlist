//
//  SearchView.swift
//  Wishlist
//
//  Created by Kurtis Hill on 10/10/19.
//  Copyright © 2019 Kurtis Hill. All rights reserved.
//

import SwiftUI
import UIKit

struct SearchView: View {
    @State var searchableString: String = ""
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text("Search Products")
                    .font(.custom(AssetsFonts.primaryFont, size: 30))
                
                Spacer()
            }
            
            HStack(spacing: 15) {
                SearchBar(searchableString: self.$searchableString)
                Button(action: {
                    
                }) {
                    Circle()
                        .frame(width: 50, height: 50)
                        .foregroundColor(AssetColors.accentColor)
                        .overlay(
                            Image(systemName: "arrow.right")
                                .foregroundColor(.white)
                        )
                }
            }
            
            Spacer()
        }.padding(.all, 20)
    }
}

struct SearchBar: View {
    @Binding var searchableString: String
    
    var body: some View {
        TextField("Search", text: self.$searchableString)
        .frame(height: 50)
        .padding(.leading, 30)
        .background(Color.gray.opacity(0.2))
        .mask(RoundedRectangle(cornerRadius: 7))
        .font(.custom(AssetsFonts.primaryFont, size: 17))
        .overlay(HStack {
                Image(systemName: "magnifyingglass")
                Spacer()
            }.padding(.leading, 7)
        )
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
