//
//  SignInService.swift
//  Wishlist
//
//  Created by Kurtis Hill on 9/28/19.
//  Copyright © 2019 Kurtis Hill. All rights reserved.
//

import Foundation

class LoginService {
    let loginNetwork: LoginNetworkProtocol
    
    init(loginNetwork: LoginNetworkProtocol) {
        self.loginNetwork = loginNetwork
    }
    
    func login(username: String, password: String) -> User? {
        do {
            let user = try loginNetwork.login(username: username, password: password)
            return user
        } catch {
            print("Error: ", error)
            return nil
        }
    }
}
