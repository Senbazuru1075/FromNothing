//
//  CustomNeuromorphicCircularButton.swift
//  FromNothing
//
//  Created by Remmington Damper on 12/8/22.
//

import SwiftUI

struct CustomNeuromorphicCircularButton: View {
    @Environment(\.colorScheme) var colorScheme
    var action: () -> ()
    var systemImage: String
    var body: some View {
        Button {
            
        } label: {
            Image(systemName: systemImage)
                .resizable()
                .renderingMode(.template)
                .padding()
                .scaledToFill()
                .frame(width: 57, height: 57)
        }
        .frame(width: 57, height: 57)
//        .buttonStyle(CircularNeuroMorphicStyle(isDarkMode: colorScheme))
//        .buttonStyle(CircularNeuroMorphicStyle(isDarkMode: colorScheme))
    }
}

struct CustomNeuromorphicCircularButton_Previews: PreviewProvider {
    static var previews: some View {
        CustomNeuromorphicCircularButton(action: {}, systemImage: "contextualmenu.and.cursorarrow")
    }
}
