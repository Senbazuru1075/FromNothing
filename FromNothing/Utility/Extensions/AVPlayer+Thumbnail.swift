//
//  AVPlayer+Thumbnail.swift
//  FromNothing
//
//  Created by Remmington Damper on 12/8/22.
//

import Foundation
import AVKit
import SwiftUI

extension AVPlayer {
    func generateThumbnail(time: CMTime) -> Image? {
        guard let asset = currentItem?.asset else { return nil }
        let imageGenerator = AVAssetImageGenerator(asset: asset)

        do {
            let cgImage = try imageGenerator.copyCGImage(at: time, actualTime: nil)
            return Image(cgImage, scale: 0.75, label: Text(""))
        } catch {
            print(error.localizedDescription)
        }

        return nil
    }
}
