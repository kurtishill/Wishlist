//
//  WebView.swift
//  Wishlist
//
//  Created by Kurtis Hill on 11/29/19.
//  Copyright © 2019 Kurtis Hill. All rights reserved.
//

import SwiftUI
import WebKit

struct WebView: View {
    let url: String
    
    var body: some View {
        WKWV(url: url)
    }
}

//struct WebView_Previews: PreviewProvider {
//    static var previews: some View {
//        WebView()
//    }
//}

struct WKWV: UIViewRepresentable {
    
    let url: String
    
    func makeUIView(context: Context) -> WKWebView {
        let request = URLRequest(url: url.url)
        let wv = WKWebView()
        wv.load(request)
        return wv
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) {
        
    }
}
