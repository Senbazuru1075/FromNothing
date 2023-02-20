//
//  StartupView.swift
//  DealHelper
//
//  Created by Remmington Damper on 1/13/23.
//

import SwiftUI
import YouTubeiOSPlayerHelper

//MARK: Startup View, Holder for onboarding, Authorized Holder, and Signup
///This view is the first true screen of the app, but has no display. It acts as a holder for the app.
struct StartupView: View {
    
    //MARK: View Models
    @ObservedObject var viewModel: StartupViewModel
    
    //MARK: Initializers
    init(viewModel: StartupViewModel) {
        self.viewModel = viewModel
    }
    
    //MARK: Start of View
    var body: some View {
        switch viewModel.state {
        //Onboarding
        case .onboarding:
            OnboardingView(viewModel: OnboardingViewModel(delegate: self.viewModel, service: OnboardingServiceImplementation()))
        //actual app entry
        case .authorized:
            AuthorizedView(viewModel: AuthViewModel())
        //signup view
        case .signup:
            SignupView(viewModel: SignupViewModel(service: AuthServiceImplementation(), onboardResetDelegate: OnboardingViewModel(delegate: self.viewModel, service: OnboardingServiceImplementation()), loginFlowResetDelegate: self.viewModel))
        }
    }
}

