//
//  VideoView.swift
//  ClearAcquire
//
//  Created by Remmington Damper on 9/29/22.
//

import SwiftUI
import AVKit

struct VideoView: View {
    @Environment(\.presentationMode) var presentationMode
    var url: URL
    var player: AVPlayer
    init(url: URL, player: AVPlayer) {
        self.url = url
        self.player = player
    }
    var body: some View {
        VideoPlayer(player: player) {
            VStack {
                Spacer()
                HStack {
                    Spacer()
                    CustomizedButton {
                        presentationMode.wrappedValue.dismiss()
                    } content: {
                        Text("Exit Video")
                            .font(.largeTitle)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                    }
                }
            }
        }
    }
}

struct VideoView_Previews: PreviewProvider {
    static var previews: some View {
        VideoView(url: Bundle.main.url(forResource: "Video", withExtension: ".mov")!, player: AVPlayer(url: Bundle.main.url(forResource: "Video", withExtension: ".mov")!))
    }
}
