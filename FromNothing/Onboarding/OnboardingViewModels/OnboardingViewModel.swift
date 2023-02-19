//
//  OnboardingViewModel.swift
//  DealHelper
//
//  Created by Remmington Damper on 1/13/23.
//

import Foundation
import Combine
import FirebaseCore
import FirebaseAuth
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
    var service: OnboardingService
    
    init(delegate: OnboardingDelegate? = nil, service: OnboardingService) {
        self.delegate = delegate
        self.service = service
        Auth.auth().signInAnonymously()
    }
    @MainActor
    func fetchOnboardingItems() async throws {
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
    
    private func onOnboardingCompleted() {
        self.delegate?.onOnboardingComplete()
    }
    
    
}

extension OnboardingViewModel: OnboardingItemDelegate {
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

    func countItemPresses() {
        print("called count presses")
        for _ in items {
            if checkPressed && self.counter == self.items.count {
                onOnboardingCompleted()
            }
        }
    }
}

extension OnboardingViewModel: OnboardingResetDelegate {
    func resetOnboarding() {
        self.counter = 0
    }
}
