//
//  SignInService.swift
//  Wishlist
//
//  Created by Kurtis Hill on 9/28/19.
//  Copyright © 2019 Kurtis Hill. All rights reserved.
//

import Foundation

class LogInService {
    let logInNetwork: LogInNetworkProtocol
    
    init(logInNetwork: LogInNetworkProtocol) {
        self.logInNetwork = logInNetwork
    }
    
    func logIn(username: String, password: String) -> User? {
        do {
            let user = try logInNetwork.logIn(username: username, password: password)
            return user
        } catch {
            print("Error: ", error)
            return nil
        }
    }
}
