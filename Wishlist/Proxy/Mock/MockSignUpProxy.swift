//
//  MockSignUp.swift
//  Wishlist
//
//  Created by Kurtis Hill on 10/1/19.
//  Copyright © 2019 Kurtis Hill. All rights reserved.
//

import Foundation

class MockSignUpProxy: SignUpProxyProtocol {
    func signUp(username: String, password: String, name: String, birthdate: String) throws -> User {
        let s = DispatchSemaphore(value: 0)
        _ = s.wait(timeout: .now() + 1.0)
        return MockData.users.authenticatedUser
    }
}
