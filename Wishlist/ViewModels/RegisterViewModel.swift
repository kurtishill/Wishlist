//
//  RegisterViewModel.swift
//  Wishlist
//
//  Created by Kurtis Hill on 9/28/19.
//  Copyright © 2019 Kurtis Hill. All rights reserved.
//

import Foundation
import Combine

class RegisterViewModel: ObservableObject {
    let logInService: LogInService
    let signUpService: SignUpService
    
    @Published var isSigningUp: Bool = false
    @Published var isLoggingIn: Bool = false
    
    @Published var isLoggedIn: Int? = 0
    @Published var isSignedUp: Int? = 0
    
    init(logInService: LogInService, signUpService: SignUpService) {
        self.logInService = logInService
        self.signUpService = signUpService
    }
    
    func signIn(username: String, password: String) {
        self.isLoggingIn = true
        DispatchQueue.global(qos: .background).async {
            let user = self.logInService.logIn(username: username, password: password)
            // TODO do something with user
            DispatchQueue.main.async {
                self.isLoggingIn = false
                
                if user != nil {
                    self.isLoggedIn = 1
                } else {
                    // TODO
                    print("not signed in")
                }
            }
        }
    }
    
    func signUp() {
        
    }
}
