//
//  OnboardingViewModel.swift
//  DealHelper
//
//  Created by Remmington Damper on 1/13/23.
//

import Foundation
import Combine
import SwiftUI

//MARK: Protocols
///This delegate handles the upward flow of onboarding completion to present signup view through state change from the signup viewmodel
protocol OnboardingDelegate: AnyObject {
    func onOnboardingComplete()
}

//MARK: Onboarding View Model Class, services the production of onboarding items
///This onboarding class manages the presentation of items for the onboarding views which ForEachs through all onboarding Items
class OnboardingViewModel: ObservableObject {
    
    //MARK: Published Properties
    ///The counter manages the onboarding count to present the signup view
    @Published var counter: Int = 0
    ///The complete set of onboarding item array items that will be used to present the view
    @Published var items: [OnboardingItem] = []
    ///The checkpressed variable helps the counter increment through linking with the onboarding Item delegate in the onboarding Item View Model
    private var checkPressed: Bool = false
    
    //MARK: Delegate Properties
    ///The delegate property for the onboarding delgate protocol calls the onboard complete function in the Onboarding Startup View Model to end the process of onboarding and proceed to signup
    private weak var delegate: OnboardingDelegate?
    
    //MARK: Service Properties
    ///The onboarding service handles all of the Firebase API calls for onboarding and JSON Parsing and offline viewing
    var service: OnboardingService
    
    //MARK: Initializers
    init(delegate: OnboardingDelegate? = nil, service: OnboardingService) {
        self.delegate = delegate
        self.service = service
    }
    
    //TODO: - Add check for network connectivity to do offline and online viewing
    
    //MARK: Functions
    ///The fetchOnboardingItems function calls the onboarding items to be display and attaches them to the items property in this class
    @MainActor func fetchOnboardingItems() async throws {
        do {
            let response = try await service.downloadOnboardingDataOffline()
            guard let response else {
                throw service.error!
            }
            self.items = response.onboardingItems
        } catch {
            print(String(describing: error))
            throw error
        }
    }
    
    //MARK: Delegate Functions
    ///This function calls the delegate method to complete onboarding through the Startup View Model and move the onboarding process to signup
    private func onOnboardingCompleted() {
        self.delegate?.onOnboardingComplete()
    }
}

//MARK: Extensions
extension OnboardingViewModel: OnboardingItemDelegate {
    ///computed delegate property from pro that calls the check pressed variable to set values for verifying count
    var pressedAndStacked: Bool {
        get {
            return self.checkPressed
        }
        set {
            if newValue == true {
                self.checkPressed = newValue
                self.counter += 1
            } else {
                self.checkPressed = newValue
                self.counter -= 1
            }
        }
    }
    ///this delegate method checks for the end of onboarding
    func countItemPresses() {
        print("called count presses")
        for _ in items {
            if checkPressed && self.counter == self.items.count {
                onOnboardingCompleted()
            }
        }
    }
}

