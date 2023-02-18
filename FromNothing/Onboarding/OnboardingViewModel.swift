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

protocol OnboardingDelegate: AnyObject {
    func onOnboardingComplete()
    func onOnboardingItemPressed()
}

class OnboardingViewModel: ObservableObject {
    @Published var items: [OnboardingItem] = []
    @Published var url: URL = Bundle.main.url(forResource: "Video", withExtension: ".mov")!
    private weak var delegate: OnboardingDelegate?
    var service: OnboardingService
    var seconds: Int = 0

    
    init(delegate: OnboardingDelegate? = nil, service: OnboardingService) {
        self.delegate = delegate
        self.service = service
        Auth.auth().signInAnonymously()
    }
    func fetchOnboardingItems() async throws {
        let response = try await service.downloadOnboardingData()
        guard let onboardingItems = response?.onboardingItems else { throw service.error! }
        DispatchQueue.main.async {
            self.items = onboardingItems
        }
    }
    func fetchOnboardingURL() async throws {
        let response = try await service.downloadIntroVideo()
        self.url = response
    }
    func onCompletionButtonPressed() {
        delegate?.onOnboardingComplete()
    }
    func whenOnboardingItemPressed() {
        delegate?.onOnboardingItemPressed()
    }
}
