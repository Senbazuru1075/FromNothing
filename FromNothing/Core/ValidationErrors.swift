//
//  ValidationErrors.swift
//  FromNothing
//
//  Created by Remmington Damper on 3/16/23.
//

import Foundation

enum ValidationError: Error {
    case missingValue(String)
    case invalidType(String, String)
    case inconsistentData(String)
}
