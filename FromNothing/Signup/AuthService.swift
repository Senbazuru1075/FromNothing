//
//  AuthService.swift
//  FromNothing
//
//  Created by Remmington Damper on 2/19/23.
//

import Foundation
import FirebaseCore
import GoogleSignIn
import GoogleSignInSwift

protocol AuthService {
    func signinWithGoolge()
    func signout()
    var error: Error?
}

class AuthServiceImplementation: AuthService {
    var error: Error?

    func signinWithGoolge() {
        
    }
    func signout() {
        
    }
}
