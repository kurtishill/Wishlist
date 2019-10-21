//
//  SearchViewModel.swift
//  Wishlist
//
//  Created by Kurtis Hill on 10/10/19.
//  Copyright © 2019 Kurtis Hill. All rights reserved.
//

import Foundation
import Combine

class SearchViewModel: ObservableObject, GridViewSelectDelegate {
    let searchService: SearchService
    
    @Published var items: [Item] = []
    @Published var searchErrorMessage: String = ""
    @Published var searchBarError: Bool = false
    @Published var isLoading: Bool = false
    
    @Published var selectedItems: [Item] = []
    
    init() {
        self.searchService = SearchService()
    }
    
    func search(for keyword: String) {
        if !keyword.isEmpty {
        
            self.searchBarError = false
            self.isLoading = true
            self.searchErrorMessage = ""
            self.items = []
            
            DispatchQueue.global(qos: .background).async {
                let items = self.searchService.search(for: keyword)
                    DispatchQueue.main.async {
                        self.isLoading = false
                        if items != nil {
                            self.items = items!
                        } else {
                            self.searchErrorMessage = "No search results found!"
                            return
                        }
                    }
            }
        } else {
            self.searchBarError = true
        }
    }
    
    func favoriteTapped(for item: Item) {
        if self.selectedItems.contains(item) {
            self.selectedItems.remove(at: self.selectedItems.firstIndex(of: item)!)
        } else {
            self.selectedItems.append(item)
        }
    }
    
    func isItemFavorited(_ item: Item) -> Bool {
        return self.selectedItems.contains(item)
    }
}
