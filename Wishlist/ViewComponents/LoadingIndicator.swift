//
//  LoadingIndicator.swift
//  Wishlist
//
//  Created by Kurtis Hill on 9/28/19.
//  Copyright © 2019 Kurtis Hill. All rights reserved.
//

import SwiftUI

struct LoadingIndicator: View {
    @State private var fillPoint = 0.0
    @State private var colorIndex = 0
    @State private var colors: [Color] = [
        AssetColors.primaryColor,
        AssetColors.warningColor,
        AssetColors.darkPrimaryColor,
        AssetColors.accentColor2
    ]
    
    let duration = 0.8
    
    private var animation: Animation {
        Animation.linear(duration: duration).repeatForever(autoreverses: false)
    }
    
    private var timer: Timer {
        Timer.scheduledTimer(withTimeInterval: duration, repeats: true) { _ in
            self.colorIndex = (self.colorIndex + 1) % self.colors.count
        }
    }
    
    var body: some View {
        Ring(fillPoint: fillPoint).stroke(colors[colorIndex], lineWidth: 10)
            .frame(width: 25, height: 25)
            .onAppear() {
                withAnimation(self.animation) {
                    self.fillPoint = 1.0
                    _ = self.timer
                }
        }
    }
}

struct Ring: Shape {
    var fillPoint: Double
    var delayPoint: Double = 0.5
    
    var animatableData: Double {
        get { return fillPoint }
        set { fillPoint = newValue }
    }
    
    func path(in rect: CGRect) -> Path {
        var start: Double
        let end = 360 * fillPoint
        
        if fillPoint > delayPoint {
            start = (2 * fillPoint) * 360
        } else {
            start = 0
        }
        
        var path = Path()
        
        path.addArc(
            center: CGPoint(x: rect.size.width / 2, y: rect.size.height / 2),
            radius: rect.size.width / 2,
            startAngle: .degrees(start),
            endAngle: .degrees(end),
            clockwise: false
        )
        
        return path
    }
}

//struct LoadingIndicator_Previews: PreviewProvider {
//    static var previews: some View {
//        LoadingIndicator()
//    }
//}
