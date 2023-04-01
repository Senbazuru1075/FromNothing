//
//  BusinessSensitivity.swift
//  FromNothing
//
//  Created by Remmington Damper on 3/16/23.
//

import Foundation

final class BusinessSensitivity {
    var variableName: String
    var variableValues: Double
    var currentValues: Double
    var currentRatio: Double
    var quickRatio: Double
    var debtToEquityRatio: Double
    var returnOnEquity: Double
    
    init(variableName: String, variableValues: Double, currentValues: Double, currentRatio: Double, quickRatio: Double, debtToEquityRatio: Double, returnOnEquity: Double) {
        self.variableName = variableName
        self.variableValues = variableValues
        self.currentValues = currentValues
        self.currentRatio = currentRatio
        self.quickRatio = quickRatio
        self.debtToEquityRatio = debtToEquityRatio
        self.returnOnEquity = returnOnEquity
    }
}
