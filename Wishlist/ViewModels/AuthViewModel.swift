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
    let loginService: LoginService = LoginService()
    let signUpService: SignUpService = SignUpService()
    
    @Published var isAuthenticating: Bool = false
    @Published var isAuthenticated: Int? = 0
    
    @Published var usernameHasError: Bool = false
    @Published var passwordHasError: Bool = false
    @Published var nameHasError: Bool = false
    @Published var birthdateHasError: Bool = false
    
    @Published var state: AuthState
    
    init() {
        self.state = LoginState(loginService: self.loginService)
    }
    
    func toggleState() {
        self.state = self.state is LoginState
            ? SignUpState(signUpService: self.signUpService)
            : LoginState(loginService: self.loginService)
    }
    
    func authenticate(data: [String : Any]) {
        self.isAuthenticating = true
        
        self.usernameHasError = !self.usernameIsValid(data["username"] as! String)
        self.passwordHasError = !self.passwordIsValid(data["password"] as! String)
        
        if self.state is SignUpState {
            self.nameHasError = !self.nameIsValid(data["name"] as! String)
            self.birthdateHasError = !self.birthdateIsValid(data["birthdate"] as! String)
        }
        
        if self.usernameHasError ||
            self.passwordHasError ||
            (
                self.state is SignUpState &&
                (
                    self.nameHasError ||
                    self.birthdateHasError
                )
            )  {
            self.isAuthenticating = false
            return
        }
        
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
    
    private func usernameIsValid(_ username: String) -> Bool {
        return !username.isEmpty
    }
    
    private func passwordIsValid(_ password: String) -> Bool {
        return !password.isEmpty
    }
    
    private func nameIsValid(_ name: String) -> Bool {
        return !name.isEmpty
    }
    
    private func birthdateIsValid(_ birthdate: String) -> Bool {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM/dd/yyyy"
        let date = dateFormatter.date(from: birthdate) ?? Date()
        return date < Date() && !birthdate.isEmpty
    }
}
