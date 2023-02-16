//
//  View+ScreenBounds.swift
//  FromNothing
//
//  Created by Remmington Damper on 12/8/22.
//

import Foundation
import SwiftUI

extension View {
    func getScreenSize() -> CGRect {
        return UIScreen.main.bounds
    }
}
