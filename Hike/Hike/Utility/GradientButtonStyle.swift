//
//  GradientButtonStyle.swift
//  Hike
//
//  Created by Dhruva Patil on 2024-12-31.
//

import Foundation
import SwiftUI

struct GradientButton: ButtonStyle{
    func makeBody(configuration: Configuration) -> some View {
        configuration
            .label
            .padding(.vertical)
            .padding(.horizontal,30)
            .background(
                configuration.isPressed ?
                    LinearGradient(colors: [.customGrayMedium , .customGrayLight], startPoint: .top, endPoint: .bottom)
                :
                    LinearGradient(colors: [.customGrayLight,.customGrayMedium], startPoint: .top, endPoint: .bottom)
            )
            .cornerRadius(40) 
    }
}
