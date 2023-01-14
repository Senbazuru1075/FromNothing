//
//  OnboardingDelegateFake.swift
//  DealHelper
//
//  Created by Remmington Damper on 1/13/23.
//

import Foundation

@testable import DealHelper

class OnboardingDelegateFake: OnboardingDelegate {
    var onBoardingCompleteCalled = false
    func onOnboardingComplete() {
        onBoardingCompleteCalled = true
    }
}
