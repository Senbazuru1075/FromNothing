//
//  StartupViewModelTests.swift
//  DealHelperTests
//
//  Created by Remmington Damper on 1/13/23.
//

import Foundation
import XCTest

@testable import DealHelper

class StartupViewModelTests: XCTestCase {
    private var startupViewModel: StartupViewModel!
    
    override func setUp() {
        super.setUp()
        startupViewModel = StartupViewModel()
    }
    
    func testOnOnboardingComplete() {
        startupViewModel.onOnboardingComplete()
        XCTAssertTrue(startupViewModel.state == .signup)
    }
}
