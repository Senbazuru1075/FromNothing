//
//  FromNothingApp.swift
//  FromNothing
//
//  Created by Remmington Damper on 2/15/23.
//

import SwiftUI
import FirebaseCore

class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        FirebaseApp.configure()
        return true
    }
}
@main
struct FromNothingApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    @StateObject var viewModel: StartupViewModel = StartupViewModel()
    
    var body: some Scene {
        WindowGroup {
            StartupView(viewModel: viewModel)
        }
    }
}
