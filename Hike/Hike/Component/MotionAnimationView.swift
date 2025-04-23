//
//  MotionAnimationView.swift
//  Hike
//
//  Created by Dhruva Patil on 2025-01-01.
//

import SwiftUI

struct MotionAnimationView: View {
    @State private var randomCircle : Int = Int.random(in : 6...12)
    @State private var isAnimating : Bool = false
    
//    FUNCTIONS
//    MARK - RANDOM COORDIANTE
    func randomCoordinate() -> CGFloat {
        return CGFloat.random(in: 0...256)
    }
//    MARK - RANDOM SIZE
    func randomSize() -> CGFloat {
        return CGFloat(Int.random(in: 4...80))
    }
//    MARK - RANDOM SCALE
    func randomScale() -> CGFloat {
        return Double.random(in: 0.1 ... 2.0 )
    }
//    MARK - RANDOM DELAY
    func randomDelay() -> Double {
        return Double.random(in: 0...2)
    }
//    MARK - RANDOM SPEED
    func randomSpeed() -> Double {
        return Double.random(in: 0.05 ... 1.0  )
    }
    
    var body: some View {
        ZStack{
            ForEach(0...randomCircle , id: \.self ) { item in
                Circle()
                    .foregroundColor(.white)
                    .opacity(0.25)
                    .frame(width: randomSize())
                    .position(x : randomCoordinate() , y : randomCoordinate())
                    .scaleEffect(isAnimating ? randomScale():1)
                    
                    .onAppear {
                        withAnimation(
                            .interpolatingSpring(stiffness: 0.2, damping: 0.5)
                            .repeatForever()
                            .speed(randomSpeed())
                            .delay(randomDelay()  )
                        ) {
                            isAnimating  = true
                        }
                    }
            }
        }.frame(width: 256, height: 256)
            .mask(Circle())
            .drawingGroup()
        //ZSTACK
    }
}

#Preview {
    MotionAnimationView()
        .background{
            Circle()
                .fill(.teal)
        }
        
    
}
