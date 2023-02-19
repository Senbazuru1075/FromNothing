//
//  YoutubeService.swift
//  FromNothing
//
//  Created by Remmington Damper on 2/19/23.
//

import Foundation
import YouTubeiOSPlayerHelper
import SwiftUI

struct MoviePlayer: UIViewRepresentable {
    let videoID: String?
    let playListID: String?
    let player: YTPlayerView = YTPlayerView()
    init(videoID: String? = nil, playListID: String? = nil) {
        self.videoID = videoID
        self.playListID = playListID
    }
    
    func makeUIView(context: Context) -> YTPlayerView {
        if let videoID {
            player.load(withVideoId: videoID, playerVars:
            [
                "controls": 1,
                "disablekb": 1,
                "modestbranding": 1,
                "playsinline": 1,
                "rel": 0,
            ]
            )
        }
        if let playListID {
            player.load(withPlaylistId: playListID, playerVars:
            [
                "controls": 1,
                "disablekb": 1,
                "modestbranding": 1,
                "playsinline": 1,
                "rel": 0,
            ]
            )
        }
        
        return player
    }
    
    func updateUIView(_ uiView: YTPlayerView, context: Context) {
        
    }
}

