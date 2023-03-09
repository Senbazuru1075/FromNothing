//
//  SignupViewModel.swift
//  FromNothing
//
//  Created by Remmington Damper on 2/18/23.
//

import Foundation
import UIKit
import SwiftUI
import FirebaseCore
import FirebaseAuth

//TODO: - fix the signup blank screen after using GIDSignIn and non-page switch.
protocol StartupResetDelegate: AnyObject {
    func resetLoginFlow()
}
protocol OnboardingResetDelegate: AnyObject {
    func resetOnboarding()
}
protocol SignupCompleteDelegate: AnyObject {
    func onCompleteSignup()
}
class SignupViewModel: ObservableObject {
    @Published var person: Person?
    
    private weak var onboardResetDelegate: OnboardingResetDelegate?
    private weak var loginFlowResetDelegate: StartupResetDelegate?
    private weak var signupCompleteDelegate: SignupCompleteDelegate?
    var service: AuthService
    init(service: AuthService, person: Person? = nil, onboardResetDelegate: OnboardingResetDelegate? = nil, loginFlowResetDelegate: StartupResetDelegate? = nil) {
        self.service = service
        self.person = person
        self.onboardResetDelegate = onboardResetDelegate
        self.loginFlowResetDelegate = loginFlowResetDelegate
    }
    
    func resetOnboarding() {
        self.onboardResetDelegate?.resetOnboarding()
        self.loginFlowResetDelegate?.resetLoginFlow()
    }
    
    @MainActor func handleSignOut() async throws {
        do {
            try service.signout()
        } catch let error {
            print(String(describing: error))
            throw error
        }
    }
   func completeAndFinishSignup() {
        self.signupCompleteDelegate?.onCompleteSignup()
    }
}





//MARK: - Functions for Google Sign in with Firebase
//
//@MainActor func handleSignIn() async throws {
//    do {
//        let response = try await service.handleSignInButton()
//        guard let personResponse = response else { return }
//        self.person = personResponse
//        if Auth.auth().currentUser != nil {
//            self.completeAndFinishSignup()
//        }
//    } catch let error {
//        print(String(describing: error))
//        throw error
//    }
//}
//
//@MainActor func restoreSignIn() async throws {
//    do {
//        self.person = try await service.restoreSignIn()
//        if Auth.auth().currentUser != nil {
//            self.completeAndFinishSignup()
//        }
//    } catch let error {
//        print(String(describing: error))
//        throw error
//    }
//}

