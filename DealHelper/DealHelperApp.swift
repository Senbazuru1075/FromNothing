//
//  DealHelperApp.swift
//  DealHelper
//
//  Created by Remmington Damper on 1/13/23.
//

import SwiftUI

@main
struct DealHelperApp: App {
    
    var body: some Scene {
        WindowGroup {
           StartupView(viewModel: StartupViewModel())
        }
    }
}
