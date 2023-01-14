//
//  OnboardingService.swift
//  DealHelper
//
//  Created by Remmington Damper on 1/13/23.
//

import Foundation

protocol OnboardingService {
    func downloadOnboardingData() async throws -> OnboardingItemResponse?
    var error: Error? { get set }
}

class FakeOnboardingServiceImplementation: OnboardingService {
    var error: Error?
    
    func downloadOnboardingData() -> OnboardingItemResponse? {
        if let url = Bundle.main.url(forResource: "onboardingdata", withExtension: "json") {
            do {
                let data = try Data(contentsOf: url)
                let decoder = JSONDecoder()
                let jsonData = try decoder.decode(OnboardingItemResponse.self, from: data)
                return jsonData
            } catch let error {
                self.error = error
            }
        }
        return nil
    }
    
}
