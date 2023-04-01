//
//  Liability.swift
//  FromNothing
//
//  Created by Remmington Damper on 3/12/23.
//

import Foundation

//TODO: - Expand Liabilities Model and Refactor it should be a single liability object
final class Liabilities {
    var name: String?
    var amount: Double?
    var description: String?
    var type: LiabilityType
    
    init(name: String? = nil, amount: Double? = nil, description: String? = nil, type: LiabilityType) {
        self.name = name
        self.amount = amount
        self.description = description
        self.type = type
    }
    
}
