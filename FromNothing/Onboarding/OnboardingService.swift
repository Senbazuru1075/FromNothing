//
//  OnboardingService.swift
//  DealHelper
//
//  Created by Remmington Damper on 1/13/23.
//

import Foundation
import Firebase
import FirebaseFunctions

protocol OnboardingService {
    func downloadOnboardingData() async throws -> OnboardingItemResponse?
    var error: Error? { get set }
}

class FakeOnboardingServiceImplementation: OnboardingService {
    var error: Error?
    
    func downloadOnboardingData() -> OnboardingItemResponse? {
        if let url = Bundle.main.url(forResource: "onboardingdata", withExtension: ".json") {
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
//
//class OnboardingServiceImplementation: OnboardingService {
//    var error: Error?
//    var onboardingItems: OnboardingItemResponse = OnboardingItemResponse(onboardingItems: [])
//    func downloadOnboardingData() async throws -> OnboardingItemResponse? {
//        
//        let functions = Functions.functions()
//        do {
//            let result = try await functions.httpsCallable("getOnboardingItems").call()
//        } catch {
//            print(error)
//        }
//        let result = try await functions.httpsCallable("getOnboardingItems").call()
//        let data = result.data as! Data
//        print(data)
//        let decoder = try JSONDecoder().decode(OnboardingItemResponse.self, from: data)
//        print(decoder.onboardingItems)
//        self.onboardingItems = decoder
//        return self.onboardingItems
//    }
//}
