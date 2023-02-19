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

//MARK: Protocol
///This protocol is the vertical service for onboarding
protocol OnboardingService {
    func downloadOnboardingDataOnline() async throws -> OnboardingItemResponse?
    func downloadOnboardingDataOffline() async throws -> OnboardingItemResponse?
    var error: Error? { get set }
}

//MARK: Onboarding Service Implementation
///This class is the implementation of the Onboarding Service
class OnboardingServiceImplementation: OnboardingService {
    
    //MARK: error property
    ///keeps track of service errors
    var error: Error?
    
    //MARK: Properties
    ///firebase storage property
    let database = Firestore.firestore()
    ///firebase storage property
    let storage = Storage.storage()
    
    //MARK: Initializer
    init() {
    }
    //MARK: Functions
    ///Downloads data from firebase
    func downloadOnboardingDataOnline() async throws -> OnboardingItemResponse? {
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
    //MARK: Firebase Local
    ///Parses the local JSON file to create onboarding
    func downloadOnboardingDataOffline() async throws -> OnboardingItemResponse? {
        if let url = Bundle.main.url(forResource: "onboardingdata", withExtension: ".json") {
            do {
                let data = try Data(contentsOf: url)
                let decoder = JSONDecoder()
                var jsonData = try decoder.decode(OnboardingItemResponse.self, from: data)
                return jsonData
            } catch let error {
                throw error
            }
        }
        return nil
    }
}

//MARK: - Unused Commented out Functions
//
//func downloadIntroVideos(item: OnboardingItemResponse) async throws -> [URL] {
//    for item in item.onboardingItems {
//        guard let videoURL = item.video else {
//            print(String(describing: error))
//            continue
//        }
//        return try await withCheckedThrowingContinuation { continuation in
//            do {
//
//                let downloadTask = storage.reference(forURL: videoURL)
//                downloadTask.downloadURL { url, error in
//                    guard error == nil else {
//                        print(String(describing: error))
//                        continuation.resume(throwing: error!)
//                        return
//                    }
//                    guard let url else {
//                        print(String(describing: error))
//                        continuation.resume(throwing: error!)
//                        return
//                    }
//
//                    Task {
//                        let value = try await self.downloadAndWriteToDisk(url: url)
//                        continuation.resume(returning: value)
//                    }
//                }
//            }
//        }
//    }
//    return []
//}

//
//    func downloadAndWriteToDisk(url: URL) async throws -> [URL] {
//        return try await withCheckedThrowingContinuation { continuation in
//            let request = URLRequest(url: url)
//            URLSession.shared.dataTask(with: request) { data, response, error in
//                guard error == nil else {
//                    print(String(describing: error))
//                    continuation.resume(throwing: error!)
//                    return
//                }
//                guard let urlResponse = response as? HTTPURLResponse else {
//                    print("We have an invalid response:  \(String(describing: error))")
//                    continuation.resume(throwing: error!)
//                    return
//                }
//                guard let data else {
//                    print("Unsuccessfully unwrapped data: \(String(describing: error))")
//                    continuation.resume(throwing: error!)
//                    return
//                }
//
//                guard urlResponse.statusCode >= 200 && urlResponse.statusCode < 300 else {
//                    print("Status code should be 2xx but it is actually \(urlResponse.statusCode)")
//                    continuation.resume(throwing: error!)
//                    return
//                }
//                do {
//                    print("successfully downloaded data!")
//                    print(url.relativePath)
//                    let tmpURL = self.service.returnTempDirectory()
//                    try data.write(to: tmpURL, options: .completeFileProtection)
//                    let localURLs = self.service.retrieveFiles()
//                    var urlArray: [URL] = []
//                    for localURL in localURLs {
//                        if localURL.pathComponents.contains("onboardingItems") {
//                            urlArray.append(localURL)
//                            continuation.resume(returning: urlArray)
//                        }
//                    }
//                } catch {
//                    self.error = error
//                    print(String(describing: error))
//                    continuation.resume(throwing: error)
//                }
//            }
//        }
//    }
