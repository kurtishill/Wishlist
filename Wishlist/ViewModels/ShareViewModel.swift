//
//  ShareViewModel.swift
//  Wishlist
//
//  Created by Kara Crowder on 12/2/19.
//  Copyright © 2019 Kurtis Hill. All rights reserved.
//

import Foundation

class ShareViewModel: ObservableObject {
    
    private let shareService = ShareService()
    
    private let userState: UserState = UserState.instance

    func share(_ wishlist: String, with userName: String) {
        guard let owner = userState.user?.username else { return }
        DispatchQueue.global(qos: .background).async {
            let _ = self.shareService.share(wishlist, with: userName, owner: owner)
        }
	}
}
