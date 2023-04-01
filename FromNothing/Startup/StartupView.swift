//
//  StartupView.swift
//  DealHelper
//
//  Created by Remmington Damper on 1/13/23.
//

import SwiftUI

//MARK: Startup View, Holder for onboarding, Authorized Holder, and Signup
///This view is the first true screen of the app, but has no display. It acts as a holder for the app.
struct StartupView: View {
    
    //MARK: View Models
    @ObservedObject var viewModel: StartupViewModel
    var isDarkMode: ColorScheme
    //MARK: Initializers
    init(viewModel: StartupViewModel, isDarkMode: ColorScheme) {
        self.viewModel = viewModel
        self.isDarkMode = isDarkMode
    }
    
    //MARK: Start of View
    var body: some View {
        switch viewModel.state {
        //Onboarding
        case .onboarding:
            OnboardingView(viewModel: OnboardingViewModel(delegate: self.viewModel, service: OnboardingServiceImplementation()))
        //actual app entry
        case .authorized:
            AuthorizedView(isDarkMode: isDarkMode, viewModel: AuthViewModel())
        }
    }
}

