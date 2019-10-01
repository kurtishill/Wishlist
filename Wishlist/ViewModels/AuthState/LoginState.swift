//
//  LoginState.swift
//  Wishlist
//
//  Created by Kurtis Hill on 9/30/19.
//  Copyright © 2019 Kurtis Hill. All rights reserved.
//

import Foundation

class LoginState: AuthState {
    var loginService: LoginService
    
    init(loginService: LoginService) {
        self.loginService = loginService
    }
    
    func authenticate(data: [String : Any], completion: @escaping (User?) -> Void) {
        DispatchQueue.global(qos: .background).async {
            let user = self.loginService.login(username: data["username"] as! String, password: data["password"] as! String)
            completion(user)
        }
    }
}
