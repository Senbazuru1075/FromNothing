//
//  OnboardingService.swift
//  DealHelper
//
//  Created by Remmington Damper on 1/13/23.
//

import Foundation
import FirebaseCore
import FirebaseFirestore
import FirebaseAuth
import FirebaseStorage

protocol OnboardingService {
    func downloadOnboardingData() async throws -> OnboardingItemResponse?
    func downloadIntroVideo() async throws -> URL
    var error: Error? { get set }
}

class FakeOnboardingServiceImplementation: OnboardingService {
    func downloadIntroVideo() async throws -> URL {
        return URL(string: "/something/somthing/somthing.m4v")!
    }
    
    var error: Error?
    
    func downloadOnboardingData() throws -> OnboardingItemResponse? {
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

class OnboardingServiceImplementation: OnboardingService {
    var error: Error?
    let database = Firestore.firestore()
    let storage = Storage.storage()
    
    func downloadIntroVideo() async throws -> URL {
//        let pathReference = storage.reference(withPath: "videos/FromNothing Introduction.m4v")
//        let gsReference = storage.reference(forURL: "gs://fromnothing-37c9b.appspot.com/FromNothing Introduction.m4v")
        let introReference = storage.reference(forURL:"gs://fromnothing-37c9b.appspot.com/FromNothing Introduction.m4v").child("/FromNothing Introduction.m4v")
        let localURL = URL(string: "path/to/introductionVideo.m4v")!
        let downloadTask = try await introReference.writeAsync(toFile: localURL)
        
        return downloadTask
    }
    func downloadOnboardingData() async throws -> OnboardingItemResponse? {
        let collection = database.collection("OnboardingItems")
        return try await withCheckedThrowingContinuation { continuation in
                collection.getDocuments(completion: { snapshot, error in
                    guard error == nil else {
                        self.error = error
                        print(String(describing: self.error))
                        continuation.resume(throwing: error!)
                        return
                    }
                    guard snapshot != nil else {
                        self.error = error
                        print(String(describing: self.error))
                        continuation.resume(throwing: error!)
                        return
                    }
                    guard let collectionDocuments = snapshot else {
                        self.error = error
                        print(String(describing: self.error))
                        continuation.resume(throwing: error!)
                        return
                    }
                   
                    do {
                        var data: [String: Any] = [:]
                        for document in collectionDocuments.documents {
                            data = document.data()
                        }
                        let jsonData = try JSONSerialization.data(withJSONObject: data, options: [])
                        let decoder = JSONDecoder()
                        decoder.dataDecodingStrategy = .deferredToData
                        let onboardingResponse = try decoder.decode(OnboardingItemResponse.self, from: jsonData)
                        
                        continuation.resume(returning: onboardingResponse)
                        
                        
                    } catch {
                        self.error = error
                        print(String(describing: self.error))
                        continuation.resume(throwing: error)
                    }
                })
            }
        }
    
    
    
}
