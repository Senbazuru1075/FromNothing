//
//  NeuromorphicButtonModifier.swift
//  FromNothing
//
//  Created by Remmington Damper on 12/4/22.
//

import Foundation
import SwiftUI

struct NeuroMorphicButtonStyle: ButtonStyle {
    var isDarkMode: ColorScheme
    func makeBody(configuration: Configuration) -> some View {
        
        configuration.label
            .background(Color("mainbackgroundcolor"))
            .cornerRadius(18)
            .overlay (
                VStack {
                    if configuration.isPressed {
                        RoundedRectangle(cornerRadius: 18)
                            .stroke(Color.black.opacity(0.05), lineWidth:4)
                            .shadow(color: Color.black.opacity(0.2), radius: 3, x: 5, y: 5)
                            .clipShape(RoundedRectangle(cornerRadius: 18))
                            .shadow(color: Color.black.opacity(0.2), radius: 3, x: -5, y: -5)
                            .clipShape(RoundedRectangle(cornerRadius: 18))
                          

                    }
                }
            )
            .shadow(color: Color.black.opacity(configuration.isPressed ? 0 : 0.2), radius: 3, x: 5, y: 5)
            .shadow(color: isDarkMode == .dark ? Color.gray.opacity(configuration.isPressed ? 0 : 0.7) : Color.white.opacity(configuration.isPressed ? 0 : 0.7), radius: 3, x: -5, y: -5)
    }
}

