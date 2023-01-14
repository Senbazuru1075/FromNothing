//
//  DefaultButtonModifier.swift
//  Dreamquisition
//
//  Created by Remmington Damper on 9/22/22.
//

import SwiftUI
//MARK: Produceable
struct DefaultButtonModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .foregroundColor(Color.primary)
            .font(.title)
            .fontWeight(.bold)
            .shadow(radius: 5)
            .padding()
            .background(
                Color("defaultbuttoncolor"
                     ))
            .cornerRadius(16)
            .frame(width: 350, height: 80)
            .shadow(radius: 5)
            .lineLimit(nil)
            .multilineTextAlignment(.center)
    }
}

struct DefaultNavigationButtonModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .foregroundColor(Color.primary)
            .font(.headline)
            .fontWeight(.bold)
            .shadow(radius: 5)
            .padding()
            .background(Color("defaultbuttoncolor"))
            .cornerRadius(16)
            .frame(width: 120, height: 40)
            .shadow(radius: 5)
            .lineLimit(nil)
            .multilineTextAlignment(.center)
    }
}

extension View {
    
    func withDefaultButtonModifier() -> some View {
        self.modifier(DefaultButtonModifier())
    }
}

extension View {
    
    func withDefaultNavigationButtonModifier() -> some View {
        self.modifier(DefaultNavigationButtonModifier())
    }
}
