//
//  StartupStore.swift
//  FromNoting
//
//  Created by Remmington Damper on 2/17/23.
//

import Foundation
import FirebaseCore
import FirebaseAuth

struct Startup: ReducerProtocol {
    struct StartupState: Equatable {
        var startupState: AppEntryStates
        @AppStorage("notSignedIn") var notSignedIn: Bool = true
        @AppStorage("firstTenLaunches") var firstTenLaunches: Bool = true
        @AppStorage("isAnonymousUser") var isAnonymousUser: Bool = false
        @AppStorage("launchCount") var launchCount: Int = 0
        @AppStorage("isFirstLaunch") var isFirstLaunch: Bool = true
        var anonymousUser: AuthDataResult
        var userID: Int
        
    }
    
    enum StartupActions: Equatable {
        case firstLoad
        case startOnboarding
        case finishedOnboarding
        case signedUp
        case loggedIn
        case authorized
        case checkStates
        
        func checkStates() {
            guard state.isAnonymousUser == true &&
            state.firstTenLaunches == true else {
                if state.isAnonymousUser == false && state.firstTenLaunches == false {
                    fatalError("something is going wrong")
                }
            }
        }
    }
    
    enum AppEntryStates {
        case onboarding
        case signup
        case authorized
    }
    var body: some ReducerProtocol<StartupState, StartupActions> {
        Reduce { state, action in
            switch action {
            case .firstLoad:
                action.checkStates()
                if state.isFirstLaunch == true {
                    state.launchCount += 1
                    Auth.auth().signInAnonymously { authResult, error in
                        guard error == nil else { return }
                        guard let authResult else { return }
                        state.userID = authResult.user.uid
                        state.anonymousUser = authResult.user
                        state.isAnonymousUser = authResult.isAnonymous
                    }
                    state.firstTenLaunches = true
                    state.notSignedIn = true
                    state.isFirstLaunch = false
                }
                return .none
            case .startOnboarding:
                action.checkStates()
                if state.isFirstLaunch != true {
                    
                }
            case .checkStates:
                
            default:
                return .none
            }
        }
    }
}
