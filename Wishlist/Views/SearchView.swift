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
    let listId: String
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    @ObservedObject var searchVM: SearchViewModel = SearchViewModel()
    
    @State var searchableString: String = ""
    
    @Binding var listNeedsRefresh: Bool
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text("Search Products")
                    .font(.custom(AssetsFonts.primaryFont, size: 30))
                
                Spacer()
                
                Button(action: {
                    self.searchVM.addItems(for: self.listId)
                    self.listNeedsRefresh = true
                    self.presentationMode.wrappedValue.dismiss()
                }) {
                    Text("Add")
                        .font(.custom(AssetsFonts.primaryFont, size: 17))
                        .foregroundColor(self.searchVM.selectedItems.count > 0 ? AssetColors.accentColor : Color.gray.opacity(0.2))
                        .animation(.spring())
                }
            }
            
            HStack(spacing: 15) {
                SearchBar(
                    searchableString: self.$searchableString,
                    searchBarError: self.$searchVM.searchBarError
                )
                Button(action: {
                    if !self.searchVM.isLoading {
                        self.searchVM.search(for: self.searchableString)
                    }
                }) {
                    ZStack {
                        Circle()
                            .frame(width: 50, height: 50)
                            .foregroundColor(AssetColors.accentColor)
                        
                        if self.searchVM.isLoading {
                            LoadingIndicator()
                        } else {
                            Image(systemName: "arrow.right")
                                .foregroundColor(.white)
                        }
                    }
                }
            }
            
            GridView(items: self.searchVM.items, gridViewDelegate: self.searchVM)
            
        }.padding(.all, 10)
            .edgesIgnoringSafeArea(.all)
            .onAppear {
                self.searchVM.search(for: "")
        }
    }
}

struct SearchBar: View {
    @Binding var searchableString: String
    @Binding var searchBarError: Bool
    
    var body: some View {
        TextField("Search", text: self.$searchableString)
        .frame(height: 50)
        .padding(.leading, 30)
        .background(self.searchBarError ? AssetColors.warningColor : Color.gray.opacity(0.2))
        .animation(.spring())
        .mask(RoundedRectangle(cornerRadius: 7))
        .font(.custom(AssetsFonts.primaryFont, size: 17))
        .overlay(HStack {
                Image(systemName: "magnifyingglass")
                Spacer()
            }.padding(.leading, 7)
        )
    }
}

//struct SearchView_Previews: PreviewProvider {
//    static var previews: some View {
//        SearchView()
//    }
//}
