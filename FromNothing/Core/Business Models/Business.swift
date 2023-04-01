//
//  Business.swift
//  FromNothing
//
//  Created by Remmington Damper on 3/11/23.
//

import Foundation

final class Business {
    var businessName: String
    var businessDescription: String?
    var balanceSheet: BalanceSheet?
    var incomeStatement: IncomeStatement?
    var cashflowStatement: CashflowStatement?
    var historicalData: HistoricalData?
    var businessSensitivity: BusinessSensitivity?
    
    init(businessName: String, businessDescription: String? = nil, balanceSheet: BalanceSheet? = nil, incomeStatement: IncomeStatement? = nil, cashflowStatement: CashflowStatement? = nil, historicalData: HistoricalData? = nil, businessSensitivity: BusinessSensitivity? = nil) {
        self.businessName = businessName
        self.businessDescription = businessDescription
        self.balanceSheet = balanceSheet
        self.incomeStatement = incomeStatement
        self.cashflowStatement = cashflowStatement
        self.historicalData = historicalData
        self.businessSensitivity = businessSensitivity
    }
}
