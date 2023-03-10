//
//  OnboardingItemViewModel.swift
//  DealHelper
//
//  Created by Remmington Damper on 1/13/23.
//

import Foundation


class OnboardingItemViewModel: ObservableObject {
    @Published var didPressAndStack: Bool = false {
        didSet {
          //log presses
        }
    }
    let item: OnboardingItem
    
    init(item: OnboardingItem) {
        self.item = item
    }
    
    func logPress() {
       
    }
}
