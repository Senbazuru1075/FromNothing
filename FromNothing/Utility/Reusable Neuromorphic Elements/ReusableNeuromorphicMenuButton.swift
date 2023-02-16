//
//  ReusableNeuromorphicMenuButton.swift
//  FromNothing
//
//  Created by Remmington Damper on 12/8/22.
//

import SwiftUI
import Foundation

struct ReusableNeuromorphicMenuButton<TargetView: View>: View {
    var menuButtonTitle: String
    var menuImageItemTitle: String
    var destination: TargetView
    @Environment(\.colorScheme) var colorScheme
    init(@ViewBuilder destination: () -> TargetView, menuButtonTitle: String, menuImageItemTitle: String) {
        self.destination = destination()
        self.menuButtonTitle = menuButtonTitle
        self.menuImageItemTitle = menuImageItemTitle
    }
    var body: some View {
        MenuButtonBuilderWithSystemImageName(title: menuButtonTitle, image: menuImageItemTitle, destination: destination)
    }

    @ViewBuilder func MenuButtonBuilderWithSystemImageName<TargetView: View>(title: String, image: String, destination: TargetView) -> some View {
        NavigationLink {
            destination
        } label: {
            HStack(spacing: 14) {
                Image(systemName: image)
                    .resizable()
                    .renderingMode(.template)
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 27, height: 27)
                    .padding(.horizontal)
                
                Text(title)
                    .font(.title)
                    .fontWeight(.semibold)
                    .foregroundColor(.primary)
                    .shadow(radius: 2)
                    .shadow(radius: 2)
                    .multilineTextAlignment(.leading)
                    .lineLimit(nil)
                    
            }
            .padding()
            .foregroundColor(.primary)
            .fixedSize(horizontal: true, vertical: false)
            .frame(maxWidth: .infinity, alignment: .leading)
        }
        .buttonStyle(NeuroMorphicButtonStyle(isDarkMode: colorScheme))
    }
}

struct ReusableNeuromorphicMenuButton_Previews: PreviewProvider {
    static var previews: some View {
        ReusableNeuromorphicMenuButton(destination:{ EmptyView()}, menuButtonTitle: "Something goes here", menuImageItemTitle: "pencil")
    }
}
