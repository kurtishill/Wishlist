//
//  SignUpState.swift
//  Wishlist
//
//  Created by Kurtis Hill on 9/30/19.
//  Copyright © 2019 Kurtis Hill. All rights reserved.
//

import Foundation

class SignUpState: AuthState {
    var signUpService: SignUpService
    
    init(signUpService: SignUpService) {
        self.signUpService = signUpService
    }
    func authenticate(data: [String : Any], completion: @escaping (User?) -> Void) {
        DispatchQueue.global(qos: .background).async {
            let user = self.signUpService.signUp(
                username: data["username"] as! String,
                password: data["password"] as! String,
                name: data["name"] as! String,
                birthdate: data["birthdate"] as! String
            )
            completion(user)
        }
    }
}
