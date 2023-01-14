//
//  FeedCaptionClamper.swift
//  Dreamquisition
//
//  Created by Remmington Damper on 9/22/22.
//

import Foundation
import SwiftUI

@propertyWrapper
class RestrictedCharacterCount<T: LosslessStringConvertible> {
    var maxCharacterCount: Int
    var wrappedValue: T {
        didSet {
            self.wrappedValue = trimCharactersIfNeeded(wrappedValue)
        }
    }
    
    init(wrappedValue: T, maxCharacterCount: Int) {
        self.maxCharacterCount = maxCharacterCount
        self.wrappedValue = wrappedValue
        // Manually triggering call to 'trimCharactersIfNeeded' since didSet is not triggered during setting initial value
        self.wrappedValue = trimCharactersIfNeeded(wrappedValue)
    }
 
    
    private func trimCharactersIfNeeded(_ originalValue: T) -> T {
        // Converting to string so that we can perform string related operations
        let wrappedValue = String(originalValue)
        // Getting the exceeded character count
        let extraCharacterCount = wrappedValue.count - maxCharacterCount
        // The character count is within the limit here. So,exiting early!
        guard extraCharacterCount > 0 else { return originalValue }
        
        // Trimming the extra characters at the end
        let trimmedWrappedValue = String(wrappedValue.dropLast(extraCharacterCount))
        guard let newValue = T.init(trimmedWrappedValue) else {
            assertionFailure("Something went wrong during conversion back to orginal type \(T.self)")
            return originalValue
        }
        return newValue
    }
    
    // This is what gets returned when you access your property with a $ (dollar sign) before it.
    // You can return whatever you want here.
    var projectedValue: RestrictedCharacterCount<T> {
        return self
    }
    
    func printMaximumCharacterCount() {
        print("Maximum Character Count \(maxCharacterCount)")
    }
}
