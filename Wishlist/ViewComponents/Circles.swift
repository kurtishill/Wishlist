//
//  Circles.swift
//  Wishlist
//
//  Created by Kurtis Hill on 9/27/19.
//  Copyright © 2019 Kurtis Hill. All rights reserved.
//

import SwiftUI

struct Circles: View {
    
    var body: some View {
        let smallCircles = (0..<7).map { _ in SmallCircle(size: UIScreen.main.bounds.size) }
        let largeCircles = (0..<7).map { _ in LargeCircle(size: UIScreen.main.bounds.size) }
        return VStack {
            ForEach(smallCircles) { view in view }
            ForEach(largeCircles) { view in view }
        }.frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
    }
}

struct LargeCircle: View, Identifiable {
    var id = UUID()
    var size: CGSize
    
    var body: some View {
        let top = CGFloat.random(in: 0..<1.0) * size.height
        let left = CGFloat.random(in: 0..<1.0) * size.width
        let radius = CGFloat.random(in: 0...1.0) * size.width
        let opacity = Double.random(in: 0...1.0) * 0.75
        
        return Circle()
            .frame(width: radius, height: radius)
            .offset(x: left, y: top)
            .foregroundColor(AssetColors.accentColor).opacity(opacity)
    }
}

struct SmallCircle: View, Identifiable {
    var id = UUID()
    var size: CGSize
    
    var body: some View {
        let top = CGFloat.random(in: 0..<size.height)
        let left = CGFloat.random(in: 0..<size.width)
        let radius = CGFloat.random(in: 0...1.0) * 50.0
        let opacity = Double.random(in: 0...1.0)
        
        return Circle()
            .frame(width: radius, height: radius)
            .offset(x: left, y: top)
            .foregroundColor(AssetColors.accentColor).opacity(opacity)
    }
}

//struct Circles_Previews: PreviewProvider {
//    static var previews: some View {
//        Circles()
//    }
//}
