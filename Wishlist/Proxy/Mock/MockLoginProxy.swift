//
//  MockSignIn.swift
//  Wishlist
//
//  Created by Kurtis Hill on 9/28/19.
//  Copyright © 2019 Kurtis Hill. All rights reserved.
//

import Foundation

class MockLoginProxy: LoginProxyProtocol {
    func login(username: String, password: String) throws -> User {
        let s = DispatchSemaphore(value: 0)
        _ = s.wait(timeout: .now() + 1.0)
        return MockData.users.authenticatedUser
    }
}
