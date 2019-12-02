//
//  UserState.swift
//  Wishlist
//
//  Created by Kurtis Hill on 11/29/19.
//  Copyright © 2019 Kurtis Hill. All rights reserved.
//

import Foundation

class UserState: ObservableObject {
    static let instance = UserState()
    
    @Published var user: User?
    
    func authenticate(user: User) {
        self.user = user
    }
    
    func logout() {
        self.user = nil
    }
}
