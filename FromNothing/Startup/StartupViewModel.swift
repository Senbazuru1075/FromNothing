//
//  StartupViewModel.swift
//  DealHelper
//
//  Created by Remmington Damper on 1/13/23.
//

import Foundation

class StartupViewModel: ObservableObject {
    @Published var state: StartupState = .onboarding
    @Published var viewModel: OnboardingItemViewModel = OnboardingItemViewModel(item: nil)
    enum StartupState {
        case onboarding
        case signup
        case authorized
    }
}

extension StartupViewModel: OnboardingDelegate {
    func onOnboardingComplete() {
        state = .signup
    }
    func onOnboardingItemPressed() {
        
    }
}
