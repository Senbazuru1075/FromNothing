//
//  ReusableNeuroMorphicProfileButton.swift
//  FromNothing
//
//  Created by Remmington Damper on 12/8/22.
//

import SwiftUI

struct ReusableNeuroMorphicProfileButton<TargetView: View>: View {
        @Environment(\.colorScheme) var colorScheme
        var profilePicture: String
        var destination: TargetView
        var body: some View {
    
            NavigationLink {
                destination
            } label: {
                Image(profilePicture)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 65, height: 65)
                    .clipShape(Circle())
            }
            .buttonStyle(CircularNeuroMorphicStyle(isDarkMode: colorScheme))
            .overlay(alignment: .center) {
                withAnimation(.easeIn(duration: 1.9).repeatForever(autoreverses: true)) {
                    Circle()
                        .stroke(lineWidth: 2)
                        .foregroundColor(.secondary)
                        .shadow(radius: 1)
                        .shadow(radius: 1)
                
            }
        }
    }
}

struct ReusableNeuroMorphicProfileButton_Previews: PreviewProvider {
    static var previews: some View {
        ReusableNeuroMorphicProfileButton(profilePicture: "man", destination: EmptyView())
    }
}
