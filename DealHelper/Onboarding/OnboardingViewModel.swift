//
//  OnboardingViewModel.swift
//  DealHelper
//
//  Created by Remmington Damper on 1/13/23.
//

import Foundation

protocol OnboardingDelegate: AnyObject {
    func onOnboardingComplete()
}

class OnboardingViewModel: ObservableObject {
    @Published var items: [OnboardingItem] = []
    private weak var delegate: OnboardingDelegate?
    var service: OnboardingService
    
    init(delegate: OnboardingDelegate? = nil, service: OnboardingService) {
        self.delegate = delegate
        self.service = service
    }
    func fetchOnboardingItems() async throws {
        let response = try await service.downloadOnboardingData()
        guard let onboardingItems = response?.onboardingItems else { throw service.error! }
        self.items = onboardingItems
    }
    func onCompletionButtonPressed() {
        delegate?.onOnboardingComplete()
    }
}
