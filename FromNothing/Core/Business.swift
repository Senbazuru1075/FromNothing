//
//  Business.swift
//  FromNothing
//
//  Created by Remmington Damper on 3/11/23.
//

import Foundation

final class Business {
    var businessName: String
    var purchasePrice: Double
    var balanceSheet: BalanceSheet?
    var incomeStatement: IncomeStatement?
    var cashflowStatement: CashflowStatement?
    var historicalData: HistoricalData?
    var businessSensitivity: BusinessSensitivity
    
    init(businessName: String, purchasePrice: Double, balanceSheet: BalanceSheet? = nil, incomeStatement: IncomeStatement? = nil, cashflowStatement: CashflowStatement? = nil, historicalData: HistoricalData? = nil, businessSensitivity: BusinessSensitivity) {
        self.businessName = businessName
        self.purchasePrice = purchasePrice
        self.balanceSheet = balanceSheet
        self.incomeStatement = incomeStatement
        self.cashflowStatement = cashflowStatement
        self.historicalData = historicalData
        self.businessSensitivity = businessSensitivity
    }
}
