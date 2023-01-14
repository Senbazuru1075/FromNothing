//
//  NeuromorphicTextFieldModifier.swift
//  FromNothing
//
//  Created by Remmington Damper on 12/4/22.
//

import Foundation
import SwiftUI

struct NeuromorphicTextFieldModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding(20)
            .background(Color("mainbackgroundcolor"))
            .cornerRadius(18)
            .overlay(
                RoundedRectangle(cornerRadius: 18)
                    .stroke(Color.black.opacity(0.05), lineWidth: 4)
                    .shadow(color: Color.black.opacity(0.2), radius: 3, x: 5, y: 5)
                    .clipShape(RoundedRectangle(cornerRadius: 18))
                    .shadow(color: Color.black.opacity(0.2), radius: 3, x: -5, y: -5)
                    .clipShape(RoundedRectangle(cornerRadius: 18))
            
            )
    }
}

extension View {
    func withNeuromorphicTextFieldModifier() -> some View {
        self.modifier(NeuromorphicTextFieldModifier())
    }
}
