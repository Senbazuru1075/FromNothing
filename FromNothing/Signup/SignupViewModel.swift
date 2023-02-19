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
    
    private weak var onboardResetDelegate: OnboardingResetDelegate?
    private weak var loginFlowResetDelegate: StartupResetDelegate?
    init(onboardResetDelegate: OnboardingResetDelegate? = nil, loginFlowResetDelegate: StartupResetDelegate? = nil) {
        self.onboardResetDelegate = onboardResetDelegate
        self.loginFlowResetDelegate = loginFlowResetDelegate
    }
    
    func resetOnboarding() {
        self.onboardResetDelegate?.resetOnboarding()
        self.loginFlowResetDelegate?.resetLoginFlow()
    }
}
