//
//  NeuromorphicCircularButtonStyle.swift
//  FromNothing
//
//  Created by Remmington Damper on 12/4/22.
//

import Foundation
import SwiftUI

struct CircularNeuroMorphicStyle: ButtonStyle {
    var isDarkMode: ColorScheme
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .background(Color("mainbackgroundcolor"))
            .clipShape(Circle())
            .overlay (
                VStack {
                    if configuration.isPressed {
                        Circle()
                            .stroke(Color.black.opacity(0.05), lineWidth:4)
                            .shadow(color: Color.black.opacity(0.2), radius: 3, x: 5, y: 5)
                            .clipShape(Circle())
                            .shadow(color: Color.black.opacity(0.2), radius: 3, x: -5, y: -5)
                            .clipShape(Circle())
                          

                    }
                }
            )
            .shadow(color: Color.black.opacity(configuration.isPressed ? 0 : 0.2), radius: 3, x: 5, y: 5)
            .shadow(color: isDarkMode == .dark ? Color.gray.opacity(configuration.isPressed ? 0 : 0.7) : Color.white.opacity(configuration.isPressed ? 0 : 0.7), radius: 3, x: -5, y: -5)
    }
}



