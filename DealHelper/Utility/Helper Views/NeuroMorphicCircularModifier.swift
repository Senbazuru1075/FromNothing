//
//  NeuroMorphicCircularModifier.swift
//  FromNothing
//
//  Created by Remmington Damper on 12/8/22.
//

import Foundation
import SwiftUI

struct NeuromorphicCircularModifier: ViewModifier {
    var isDarkMode: ColorScheme
    func body(content: Content) -> some View {
        content.background(Color("mainbackgroundcolor"))
            .clipShape(Circle())
            .shadow(color: Color.black.opacity(0.2), radius: 6, x: -10, y: -10)
            .shadow(color: isDarkMode == .dark ? Color.gray.opacity(0.7) : Color.white.opacity(0.7), radius: 6, x: 8, y: 8)
    }
}

extension View {
    func withNeuromorphicCircularModifier(isDarkMode: ColorScheme) -> some View {
        self.modifier(NeuromorphicCircularModifier(isDarkMode: isDarkMode))
    }
}
