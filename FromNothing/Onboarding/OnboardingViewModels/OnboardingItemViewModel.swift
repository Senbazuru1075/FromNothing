//
//  OnboardingItemViewModel.swift
//  DealHelper
//
//  Created by Remmington Damper on 1/13/23.
//

import Foundation
import SwiftUI
import YouTubeiOSPlayerHelper

//MARK: Onboarding Delegate to Teack Onboarding
protocol OnboardingItemDelegate: AnyObject {
    func countItemPresses()
    var pressedAndStacked: Bool { get set }
}

//MARK: Onboarding Item View Model, manages card items
class OnboardingItemViewModel: ObservableObject{
    //MARK: Properties
    ///facilitates movement through onboarding
    @Published var didPressAndStack: Bool = false {
        didSet {
            
        }
     }
    ///The displayed onboarding card item
    let item: OnboardingItem
    
    //MARK: Delegate properties
    ///This delegate property sends messages so the count of item movement can be verified
    private weak var delegate: OnboardingItemDelegate?
    
    //MARK: Initializers
    ///This is the main initializer for the Onboarding Item
    init(delegate: OnboardingItemDelegate? = nil, item: OnboardingItem) {
        self.delegate = delegate
        self.item = item
        self.didPressAndStack = false
    }
    
    //MARK: Functions
    ///This function is meant to log analytic presses for user understanding
    func logPress() {
        print("Logged Press")
    }
    
    //MARK: Tracking onboarding
    ///This function is meant to verify the count of the oboarding process to proceed to signup
    func verifyAndCount() {
        self.delegate?.pressedAndStacked = self.didPressAndStack
        print("called the boolean delegate property to check for presses and manage the count")
        self.delegate?.countItemPresses()
        print("called the count method to check until end of onboarding")
    }
}
