//
//  FromNothingApp.swift
//  FromNothing
//
//  Created by Remmington Damper on 2/15/23.
//

import SwiftUI


@main
struct FromNothingApp: App {
    @StateObject var viewModel: StartupViewModel = StartupViewModel()
    var body: some Scene {
        WindowGroup {
            StartupView(viewModel: viewModel)
               
        }
    }
}
