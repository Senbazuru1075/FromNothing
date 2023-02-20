//
//  SignupViewModel.swift
//  FromNothing
//
//  Created by Remmington Damper on 2/18/23.
//

import Foundation

protocol StartupResetDelegate: AnyObject {
    func resetLoginFlow()
}
protocol OnboardingResetDelegate: AnyObject {
    func resetOnboarding()
}

class SignupViewModel: ObservableObject {
    @Published var person: Person?
    private weak var onboardResetDelegate: OnboardingResetDelegate?
    private weak var loginFlowResetDelegate: StartupResetDelegate?
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
    @MainActor func handleSignIn() async throws {
        do {
            let response = try await service.handleSignInButton()
            guard let personResponse = response else { return }
            self.person = personResponse
        } catch let error {
            print(String(describing: error))
            throw error
        }
    }
    @MainActor func handleSignOut() async throws {
        do {
            try service.signout()
        } catch let error {
            print(String(describing: error))
            throw error
        }
    }
}
