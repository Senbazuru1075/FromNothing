//
//  OnboardingItem.swift
//  DealHelper
//
//  Created by Remmington Damper on 1/13/23.
//

import Foundation

struct OnboardingItemResponse: Codable {
    var onboardingItems: [OnboardingItem]
}
struct OnboardingItem: Identifiable, Equatable, Codable {
    static func == (lhs: OnboardingItem, rhs: OnboardingItem) -> Bool {
        lhs.id == rhs.id
    }
    let id: Int
    let title: String
    let url: String?
    let description: String
}
