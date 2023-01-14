//
//  BrainCloudNetworking.swift
//  Dreamquisition
//
//  Created by Remmington Damper on 12/11/22.
//

//import Foundation
//import BrainCloud
//
//protocol BrainCloudable {
//    func startService()
//    func authenticateAnonymousUser()
//    func fetchGlobalEntity<T: Codable>(with id: String) async throws -> T
//}
//
////enum API {
////    case get
////    case post
////    case update
////    case delete
////
////    func makeAPIRequest(completion: Result<AnyObject, Error>) async throws -> {
////        URLSession.shared.dataTaskPublisher(for: )
////    }
////}
//
////extension API: BrainCloudable {
////
////    func fetchBrainCloudData() async throws -> Result<FeedData, Error> {
////        let feeds: [FeedData] = try await
////        return .failure(Error as! Error)
////    }
////}
//
//class BrainCloudService: BrainCloudable {
//    @Published var serviceOperationName = "operation"
//    @Published var jsonDataReturn = "response"
//    let _bc: BrainCloudWrapper = BrainCloudWrapper()
//    
//    func initializeBrainCloud() {
//        
//        let serverURl = "https://api.braincloudservers.com/dispatcherv2"
//        let key: String = "3990a065-afa9-41f6-84ec-a3004bef1942"
//        let id: String = "14348"
//            _bc.initialize(serverURl, secretKey: key, appId: id, appVersion: "1.0.0", companyName: "Clear Acquire", appName: "Dreamquisition")
//        
//    }
//    
//    func fetchGlobalEntity<T: Codable>(with id: String) async throws -> T {
//        try await withCheckedThrowingContinuation { continuation in
//            _bc.globalEntityService.read(id, completionBlock: { _, _, jsonString, _ in
//                if let data = jsonString?.data(using: .utf8),
//                   let decoded = try? JSONDecoder().decode(T.self, from: data){
//                    continuation.resume(returning: decoded)
//                }
//            }, errorCompletionBlock: { _, _, _, _, _, _ in
//                // TODO: Add error handling
//            }, cbObject: nil)
//        }
//    }
//    
//    func startService() {
//        initializeBrainCloud()
//    }
//    
//    func anonymousAuth() {
//        _bc.storedAnonymousId = ""
//        _bc.storedProfileId = ""
//        _bc.authenticateAnonymous(onAuthenticate, errorCompletionBlock: onAuthenticateFailed, cbObject: nil, forceCreate: true)
//    }
//    
//    func authenticateAnonymousUser() {
//        anonymousAuth()
//    }
//    func onAuthenticate(serviceName:String?, serviceOperation:String?, jsonData:String?, cbObject: NSObject?) {
//        print("\(serviceOperation!) Success \(jsonData!)")
//        serviceOperationName = serviceOperation ?? "no operation executed"
//        jsonDataReturn = jsonData ?? "success with response returned"
//    }
//    
//    func onAuthenticateFailed(serviceName:String?, serviceOperation:String?, statusCode:Int?, reasonCode:Int?, jsonError:String?, cbObject: NSObject?) {
//        print("\(serviceOperation!) Failure \(jsonError!)")
//        serviceOperationName = serviceOperation ?? "no operation executed"
//        jsonDataReturn = jsonError ?? "fail with error returned"
//    }
//    
//}
