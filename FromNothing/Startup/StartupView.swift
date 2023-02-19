//
//  StartupView.swift
//  DealHelper
//
//  Created by Remmington Damper on 1/13/23.
//

import SwiftUI
import YouTubeiOSPlayerHelper
struct StartupView: View {
    
    @ObservedObject var viewModel: StartupViewModel
    
    init(viewModel: StartupViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        switch viewModel.state {
        case .onboarding:
            OnboardingView(viewModel: OnboardingViewModel(delegate: self.viewModel, service: OnboardingServiceImplementation()))
        case .authorized:
            AuthorizedView(viewModel: AuthViewModel())
        case .signup:
            SignupView(viewModel: SignupViewModel(onboardResetDelegate: OnboardingViewModel(delegate: self.viewModel, service: OnboardingServiceImplementation()), loginFlowResetDelegate: self.viewModel))
        }
    }
}

