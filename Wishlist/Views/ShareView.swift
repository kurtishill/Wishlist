//
//  ShareView.swift
//  Wishlist
//
//  Created by Kara Crowder on 12/2/19.
//  Copyright © 2019 Kurtis Hill. All rights reserved.
//

import SwiftUI

struct ShareView: View {
	
	@State private var usernameToShareWith: String = ""
	var onDismiss: () -> ()
	
	@ObservedObject var shareVM: ShareViewModel = ShareViewModel()
	
    var body: some View {
		VStack {
			TextField("Username of who you want to share with", text: self.$usernameToShareWith)
	//			.frame(height: componentSize)
				.padding(.leading, 10)
				.background(Color.gray.opacity(0.2))
				.cornerRadius(10)
				.font(.custom(AssetsFonts.primaryFont, size: 15))
				.foregroundColor(.black)
			Button(action: {
				print("dismissing")
				self.onDismiss()
				self.shareVM.share(with: self.usernameToShareWith)
			}) {
				Text("Share")
			}
		}
    }
}

struct ShareView_Previews: PreviewProvider {
    static var previews: some View {
        ShareView(onDismiss: {})
    }
}
