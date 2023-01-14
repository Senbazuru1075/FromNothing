//
//  CustomNeuroMorphicNavBar.swift
//  FromNothing
//
//  Created by Remmington Damper on 12/8/22.
//

import SwiftUI

struct CustomNeuroMorphicNavBar: View {
    @Environment(\.colorScheme) var colorScheme
    @State var ifShowBackButton: Bool = true
    var title: String
    var subtitle: String
    var toggleMenu: () -> ()
    var body: some View {
//        ZStack {
//            Color("mainbackgroundcolor").ignoresSafeArea()
            HStack {
                if ifShowBackButton {
                    CustomNeuromorphicCircularButton(action: {}, systemImage: "chevron.left")
                }
                Spacer()
                
                NeuromorphicNavBarTitle(title: title, subtitle: subtitle)
                Spacer()
                CustomNeuromorphicCircularButton(action: {toggleMenu()}, systemImage: "contextualmenu.and.cursorarrow")
                
            }
            .padding()
            .font(.headline)
            .frame(maxWidth: .infinity)
            .fixedSize(horizontal: false, vertical: true)
            .withNeuromorphicBoxModifier(isDarkMode: colorScheme)
//        }
    }
}

struct NeuromorphicNavBarTitle: View {
    var title: String
    var subtitle: String
    var body: some View {
        VStack(spacing: 4) {
            Text(title)
                .font(.title)
                .fontWeight(.semibold)
                .foregroundColor(.primary)
                .shadow(radius: 1)
                .shadow(radius: 2)
                .multilineTextAlignment(.center)
                .lineLimit(1)
            Text(subtitle)
                .font(.callout)
                .fontWeight(.light)
                .foregroundColor(.primary)
                .shadow(radius: 1)
                .shadow(radius: 1)
                .multilineTextAlignment(.center)
                .lineLimit(nil)
                
        }
    }
}
    
struct CustomNeuroMorphicNavBar_Previews: PreviewProvider {
    static var previews: some View {
        CustomNeuroMorphicNavBar(title: "title goes here", subtitle: "subtitle goes here", toggleMenu: {})
    }
}
