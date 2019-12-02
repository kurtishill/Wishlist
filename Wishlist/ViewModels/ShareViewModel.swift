//
//  ShareViewModel.swift
//  Wishlist
//
//  Created by Kara Crowder on 12/2/19.
//  Copyright © 2019 Kurtis Hill. All rights reserved.
//

import Foundation

class ShareViewModel: ObservableObject {

	func share(with userName: String) {
		print("in the sharing \(userName)")
	}
}
