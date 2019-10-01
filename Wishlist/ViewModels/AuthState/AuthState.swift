//
//  AuthState.swift
//  Wishlist
//
//  Created by Kurtis Hill on 9/30/19.
//  Copyright © 2019 Kurtis Hill. All rights reserved.
//

import Foundation

protocol AuthState {
    func authenticate(data: [String:Any], completion: @escaping (User?) -> Void)
}
