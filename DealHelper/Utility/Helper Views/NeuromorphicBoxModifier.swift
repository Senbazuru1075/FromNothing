//
//  TopModifier.swift
//  FromNothing
//
//  Created by Remmington Damper on 12/4/22.
//

import Foundation
import SwiftUI

struct NeuromorphicBoxModifier: ViewModifier {
    var isDarkMode: ColorScheme
    func body(content: Content) -> some View {
        content.background(Color("mainbackgroundcolor"))
            .cornerRadius(18)
            .shadow(color: Color.black.opacity(0.2), radius: 6, x: -10, y: -10)
            .shadow(color: isDarkMode == .dark ? Color.gray.opacity(0.7) : Color.white.opacity(0.7), radius: 6, x: 8, y: 8)
            .shadow(radius: 3)
            .shadow(radius: 3)
    }
}

extension View {
    func withNeuromorphicBoxModifier(isDarkMode: ColorScheme) -> some View {
        self.modifier(NeuromorphicBoxModifier(isDarkMode: isDarkMode))
    }
}
