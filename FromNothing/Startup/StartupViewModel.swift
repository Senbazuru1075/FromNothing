//
//  StartupViewModel.swift
//  DealHelper
//
//  Created by Remmington Damper on 1/13/23.
//

import Foundation

//MARK: Start of StartupViewModel
///This class manages the display and onboarding of the app overall
class StartupViewModel: ObservableObject {
    
    //MARK: Properties
    ///This property manages the state of the app entry flow
    @Published var state: StartupState = .onboarding
    
    //MARK: Enums
    ///This enum is the startup state holder. It holds the beginning. Signup process. and app entry
    enum StartupState {
        case onboarding
        case authorized
    }
    
}

//MARK: Extensions
extension StartupViewModel: OnboardingDelegate {
    ///This function ends onboarding
    func onOnboardingComplete() {
        state = .authorized
    }
}
