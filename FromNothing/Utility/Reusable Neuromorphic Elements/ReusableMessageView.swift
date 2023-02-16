//
//  MessageView.swift
//  Dreamquisition
//
//  Created by Remmington Damper on 12/20/22.
//

import SwiftUI

struct ReusableMessageView: View {
    var profileUsername: String
    var profileName: String
    var messageText: String
    @Environment(\.colorScheme) var colorScheme: ColorScheme
    var body: some View {
        HStack {
            Text("@\(profileUsername) \(profileName) said: \(messageText)")
                .font(.headline)
                .fontWeight(.thin)
                .foregroundColor(.primary)
                .multilineTextAlignment(.leading)
                .lineLimit(nil)
        }
        .padding()
        .fixedSize(horizontal: false, vertical: true)
        .withNeuromorphicBoxModifier(isDarkMode: colorScheme)
    }
}

struct MessageView_Previews: PreviewProvider {
    static var previews: some View {
        ReusableMessageView(profileUsername: "Neo", profileName: "Neo Anderson", messageText: "Just focused on keeping my head down and working and spending time with family.")
    }
}
