//
//  OnboardingService.swift
//  DealHelper
//
//  Created by Remmington Damper on 1/13/23.
//

import Foundation

//MARK: Protocol
///This protocol is the vertical service for onboarding
protocol OnboardingService {
    func downloadOnboardingDataOffline() async throws -> OnboardingItemResponse?
    var error: Error? { get set }
}

//MARK: Onboarding Service Implementation
///This class is the implementation of the Onboarding Service
class OnboardingServiceImplementation: OnboardingService {
    
    //MARK: error property
    ///keeps track of service errors
    var error: Error?
    
    //MARK: Initializer
    init() {
    }
    //MARK: Functions
    
    //MARK: Local Download
    ///Parses the local JSON file to create onboarding
    func downloadOnboardingDataOffline() async throws -> OnboardingItemResponse? {
        if let url = Bundle.main.url(forResource: "onboardingdata", withExtension: ".json") {
            do {
                let data = try Data(contentsOf: url)
                let decoder = JSONDecoder()
                let jsonData = try decoder.decode(OnboardingItemResponse.self, from: data)
                return jsonData
            } catch let error {
                throw error
            }
        }
        return nil
    }
}
