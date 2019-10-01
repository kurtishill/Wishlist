//
//  AuthViewModel.swift
//  Wishlist
//
//  Created by Kurtis Hill on 9/30/19.
//  Copyright © 2019 Kurtis Hill. All rights reserved.
//

import Foundation
import Combine

class AuthViewModel: ObservableObject {
    let loginService: LoginService
    let signUpService: SignUpService
    
    @Published var isAuthenticating: Bool = false
    @Published var isAuthenticated: Int? = 0
    
    @Published var state: AuthState
    
    init() {
        self.loginService = LoginService(loginNetwork: MockLogin())
        self.signUpService = SignUpService(signUpNetwork: MockSignUp())
        self.state = LoginState(loginService: self.loginService)
    }
    
    func toggleState() {
        self.state = self.state is LoginState
            ? SignUpState(signUpService: self.signUpService)
            : LoginState(loginService: self.loginService)
    }
    
    func authenticate(data: [String : Any]) {
        self.isAuthenticating = true
        
        self.state.authenticate(data: data) { user in
            DispatchQueue.main.async {
                self.isAuthenticating = false
                
                if user != nil {
                    self.isAuthenticated = 1
                } else {
                    // TODO
                    print("logging in failed")
                }
            }
        }
    }
}
