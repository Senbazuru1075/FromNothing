//
//  StartupStore.swift
//  FromNoting
//
//  Created by Remmington Damper on 2/17/23.
//

import Foundation

struct Startup: ReducerProtocol {
    struct StartupState: Equatable {
        var startupState: AppEntryStates
        @AppStorage("notSignedIn") var notSignedIn: Bool = true
        @AppStorage("firstTenLaunches") var firstTenLaunches: Bool = true
        @AppStorage("isAnonymousUser") var isAnonymousUser: Bool = true
        
    }
    
    enum StartupActions: Equatable {
        case startedOnboarding
        case finishedOnboarding
        case signedUp
        case loggedIn
        case authorized
    }
    
    enum AppEntryStates {
        case onboarding
        case signup
        case authorized
    }
    var body: some ReducerProtocol<StartupState, StartupActions> {
        Reduce { state, action in
            switch action {
            case .startedOnboarding:
                
            default:
                return .none
            }
        }
    }
}
