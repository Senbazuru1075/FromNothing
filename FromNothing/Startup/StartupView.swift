//
//  StartupView.swift
//  DealHelper
//
//  Created by Remmington Damper on 1/13/23.
//

import SwiftUI

struct StartupView: View {
    
    @ObservedObject private var viewModel: StartupViewModel
    let onboardingService = FakeOnboardingServiceImplementation()
    
    init(viewModel: StartupViewModel) {
        self.viewModel = viewModel
    }
    var body: some View {
        switch viewModel.state {
        case .onboarding:
            OnboardingView(viewModel: OnboardingViewModel(delegate: viewModel, service: onboardingService))
        case .authorized:
            AuthorizedView()
        case .signup:
            SignupView()
        }
    }
}

struct StartupView_Previews: PreviewProvider {
    static var previews: some View {
        StartupView(viewModel: StartupViewModel())
    }
}
