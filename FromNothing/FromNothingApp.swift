//
//  FromNothingApp.swift
//  FromNothing
//
//  Created by Remmington Damper on 2/15/23.
//

import SwiftUI
import FirebaseCore
import GoogleSignIn
import GoogleSignInSwift
import UIKit

class AppDelegate: NSObject, UIApplicationDelegate {
    @ObservedObject var viewModel: StartupViewModel = StartupViewModel()
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        FirebaseApp.configure()
        
        GIDSignIn.sharedInstance.restorePreviousSignIn { user, error in
            if error != nil || user == nil {
                self.viewModel.state = .onboarding
            } else {
                self.viewModel.state = .authorized
            }
          }
        return true
    }
    func application(
      _ app: UIApplication,
      open url: URL, options: [UIApplication.OpenURLOptionsKey : Any] = [:]
    ) -> Bool {
      var handled: Bool

      handled = GIDSignIn.sharedInstance.handle(url)
      if handled {
        return true
      }

      // Handle other custom URL types.

      // If not handled by this app, return false.
      return false
    }
}
@main
struct FromNothingApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    @StateObject var viewModel: StartupViewModel = StartupViewModel()
    @State var error: Error? = nil
    var body: some Scene {
        WindowGroup {
            StartupView(viewModel: viewModel)
                .onOpenURL { url in
                      GIDSignIn.sharedInstance.handle(url)
                    }
                .onAppear {
                    GIDSignIn.sharedInstance.restorePreviousSignIn { user, error in
                        guard error == nil else {
                            print(String(describing: error!))
                            self.error = error
                            return
                        }
                        guard user?.userID != nil && user?.profile != nil else {
                            print(String(describing: error!))
                            self.error = error
                            return
                        }
                        self.viewModel.state = .onboarding
                }
            }
        }
    }
}
