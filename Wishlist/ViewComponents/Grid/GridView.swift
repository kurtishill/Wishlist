//
//  GridView.swift
//  Wishlist
//
//  Created by Kurtis Hill on 9/26/19.
//  Copyright © 2019 Kurtis Hill. All rights reserved.
//

import SwiftUI

struct GridView: View {
    let numColumns: Int = 2
    let items: [Item]
    
    var body: some View {
        let width = UIScreen.main.bounds.width / CGFloat(self.numColumns) - 30
        let height = UIScreen.main.bounds.width / CGFloat(self.numColumns) + 10
        
        let chunked = items.chunked(into: self.numColumns)
        
        return ScrollView(.vertical, showsIndicators: false) {
            VStack(alignment: .center, spacing: 15) {
                ForEach(chunked, id: \.self) { row in
                    HStack(alignment: .center, spacing: 5) {
                        ForEach(row) { item in
                            GridItemView(item: item, gridWidth: width, gridHeight: height)
                        }
                        ForEach(0..<(self.numColumns - row.count)) { _ in
                            Spacer()
                        }
                    }
                }
            }
        }.padding(.init(top: 0, leading: 15, bottom: 10, trailing: 15))
    }
}
    
//struct GridView_Previews: PreviewProvider {
//    static var previews: some View {
//        GridView()
//    }
//}
