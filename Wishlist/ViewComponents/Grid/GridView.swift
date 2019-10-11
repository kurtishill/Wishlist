//
//  GridView.swift
//  Wishlist
//
//  Created by Kurtis Hill on 9/26/19.
//  Copyright © 2019 Kurtis Hill. All rights reserved.
//

import SwiftUI

struct GridView<T: GridViewSelectDelegate>: View {
    let numColumns: Int = 2
    let items: [Item]
    
    @ObservedObject var gridViewDelegate: T
    
    var body: some View {
        let width = UIScreen.main.bounds.width / CGFloat(self.numColumns) - 30
        let height = UIScreen.main.bounds.width / CGFloat(self.numColumns) + 10
        
        let chunked = items.chunked(into: self.numColumns)
        
        return ScrollView(.vertical, showsIndicators: false) {
            VStack(alignment: .center, spacing: 5) {
                ForEach(chunked, id: \.self) { row in
                    HStack(alignment: .center, spacing: 5) {
                        ForEach(row) { item in
                            GridItemView(item: item, gridWidth: width, gridHeight: height, isItemSelected: self.gridViewDelegate.isItemSelected(item))
                                .onTapGesture {
                                    self.gridViewDelegate.itemSelected(item)
                            }.offset(x: self.numColumns - row.count > 0 ? 2.5 : 0)
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

protocol GridViewSelectDelegate: ObservableObject {
    func itemSelected(_ item: Item)
    func isItemSelected(_ item: Item) -> Bool
}
    
//struct GridView_Previews: PreviewProvider {
//    static var previews: some View {
//        GridView()
//    }
//}
