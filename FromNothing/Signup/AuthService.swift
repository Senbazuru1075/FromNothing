//
//  AuthService.swift
//  FromNothing
//
//  Created by Remmington Damper on 2/19/23.
//

import Foundation
import SwiftUI
import FirebaseCore
import FirebaseAuth
import GoogleSignIn
import GoogleSignInSwift



protocol AuthService {
    func signout() throws
    var error: Error? { get set }
}

class AuthServiceImplementation: AuthService {
    var error: Error?
    
    func signout() throws {
        do {
            GIDSignIn.sharedInstance.signOut()
            try Auth.auth().signOut()
            @AppStorage("loginStatus") var loginStatus = false
        } catch {
            print(String(describing: error))
            self.error = error
            throw error
        }
    }
  
}

//MARK: - Google SignIn Functions for Firebase
//    func restoreSignIn() async throws -> Person? {
//        var personObject: Person?
//        do {
//            let authResult = try await GIDSignIn.sharedInstance.restorePreviousSignIn()
//            let refreshed = try await authResult.refreshTokensIfNeeded()
//            if let idToken = refreshed.idToken?.tokenString {
//                let credential = GoogleAuthProvider.credential(withIDToken: idToken, accessToken: refreshed.accessToken.tokenString)
//                let signin = try await Auth.auth().signIn(with: credential)
//                return try await withCheckedThrowingContinuation { continuation in
//                    let _ = Auth.auth().addStateDidChangeListener { auth, user in
//                        guard auth.currentUser != nil else {
//                            print(String(describing: self.error!))
//                            self.error = self.error
//                            continuation.resume(throwing: self.error!)
//                            return
//                        }
//                        guard let person = user else {
//                            print(String(describing: self.error!))
//                            self.error = self.error
//                            continuation.resume(throwing: self.error!)
//                            return
//                        }
//                        @AppStorage("loginStatus") var loginStatus = true
//                        personObject = Person(uid: person.uid, profilePic: person.photoURL, firebaseEmail: person.email, displayName: person.displayName, phoneNumber: person.phoneNumber, isEmailVerified: person.isEmailVerified, isAnonymousUser: person.isAnonymous, isNewUser: signin.additionalUserInfo?.isNewUser, username: signin.additionalUserInfo?.username)
//                        continuation.resume(returning: personObject)
//                    }
//                }
//            }
//        } catch let error {
//            self.error = error
//            throw error
//        }
//        return nil
//    }
//    @MainActor func handleSignInButton() async throws -> Person? {
//        var personObject: Person?
//        do {
//            if GIDSignIn.sharedInstance.hasPreviousSignIn() {
//                let authResult = try await GIDSignIn.sharedInstance.restorePreviousSignIn()
//                let refreshed = try await authResult.refreshTokensIfNeeded()
//                if let idToken = refreshed.idToken?.tokenString {
//                    let credential = GoogleAuthProvider.credential(withIDToken: idToken, accessToken: refreshed.accessToken.tokenString)
//                    let signin = try await Auth.auth().signIn(with: credential)
//                    return try await withCheckedThrowingContinuation { continuation in
//                        let _ = Auth.auth().addStateDidChangeListener { auth, user in
//                            guard auth.currentUser != nil else {
//                                print(String(describing: self.error!))
//                                self.error = self.error
//                                continuation.resume(throwing: self.error!)
//                                return
//                            }
//                            guard let person = user else {
//                                print(String(describing: self.error!))
//                                self.error = self.error
//                                continuation.resume(throwing: self.error!)
//                                return
//                            }
//                            @AppStorage("loginStatus") var loginStatus = true
//                            personObject = Person(uid: person.uid, profilePic: person.photoURL, firebaseEmail: person.email, displayName: person.displayName, phoneNumber: person.phoneNumber, isEmailVerified: person.isEmailVerified, isAnonymousUser: person.isAnonymous, isNewUser: signin.additionalUserInfo?.isNewUser, username: signin.additionalUserInfo?.username)
//                            continuation.resume(returning: personObject)
//                        }
//                    }
//                }
//            } else {
//                guard let presentingViewController = (UIApplication.shared.connectedScenes.first as? UIWindowScene)?.windows.first?.rootViewController else {
//                    print("no root")
//                    return nil
//                }
//                guard let clientID = FirebaseApp.app()?.options.clientID else {
//                    print("could get clientID correctly")
//                    return nil
//                }
//                let config = GIDConfiguration(clientID: clientID)
//
//                let authResult = try await GIDSignIn.sharedInstance.signIn(withPresenting: presentingViewController)
//                let refreshed = try await authResult.user.refreshTokensIfNeeded()
//                if let idToken = refreshed.idToken?.tokenString {
//                let credential = GoogleAuthProvider.credential(withIDToken: idToken, accessToken: refreshed.accessToken.tokenString)
//                let signin = try await Auth.auth().signIn(with: credential)
//                    return try await withCheckedThrowingContinuation { continuation in
//                        let _ = Auth.auth().addStateDidChangeListener { auth, user in
//                            guard auth.currentUser != nil else {
//                                print(String(describing: self.error!))
//                                self.error = self.error
//                                continuation.resume(throwing: self.error!)
//                                return
//                            }
//                            guard let person = user else {
//                                print(String(describing: self.error!))
//                                self.error = self.error
//                                continuation.resume(throwing: self.error!)
//                                return
//                            }
//                            @AppStorage("loginStatus") var loginStatus = true
//                            personObject = Person(uid: person.uid, profilePic: person.photoURL, firebaseEmail: person.email, displayName: person.displayName, phoneNumber: person.phoneNumber, isEmailVerified: person.isEmailVerified, isAnonymousUser: person.isAnonymous, isNewUser: signin.additionalUserInfo?.isNewUser, username: signin.additionalUserInfo?.username)
//                            continuation.resume(returning: personObject)
//                        }
//                    }
//                }
//            }
//        } catch {
//            print(error)
//            self.error = error
//            throw error
//        }
//        print("unable to return person object")
//        return nil
//    }
