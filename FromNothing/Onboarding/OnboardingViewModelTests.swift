//
//  OnboardingViewModelTests.swift
//  DealHelperTests
//
//  Created by Remmington Damper on 1/13/23.
//

import Foundation
import XCTest

@testable import DealHelper

class OnboardingViewModelTests: XCTestCase {
    private var onboardingViewModel: OnboardingViewModel!
    private let onboardingDelegateFake: OnboardingDelegateFake = OnboardingDelegateFake()
    override func setUp() {
        super.setUp()
        onboardingViewModel = OnboardingViewModel(delegate: onboardingDelegateFake)
    }
    
    func testOnCompletionButtonPressed() {
        onboardingViewModel.onCompletionButtonPressed()
        XCTAssertTrue(onboardingDelegateFake.onBoardingCompleteCalled)
    }
}
