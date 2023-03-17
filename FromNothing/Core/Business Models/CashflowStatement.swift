//
//  CashflowStatement.swift
//  FromNothing
//
//  Created by Remmington Damper on 3/11/23.
//

import Foundation

final class CashflowStatement {
    // Operating activities
    var netIncome: Double?
    var depreciation: Double?
    var changesInWorkingCapital: Double?
    
    // Investing activities
    var capitalExpenditures: Double?
    var investments: Double?
    
    // Financing activities
    var dividends: Double?
    var debtRepaid: Double?
    var equityIssued: Double?
    
    // Cash flow totals
    var operatingCashFlow: Double? {
        guard let netIncome = netIncome, let depreciation = depreciation, let changesInWorkingCapital = changesInWorkingCapital else {
            return nil
        }
        return netIncome + depreciation + changesInWorkingCapital
    }
    var investingCashFlow: Double? {
        guard let capitalExpenditures = capitalExpenditures, let investments = investments else {
            return nil
        }
        return -1 * (capitalExpenditures + investments)
    }
    var financingCashFlow: Double? {
        guard let dividends = dividends, let debtRepaid = debtRepaid, let equityIssued = equityIssued else {
            return nil
        }
        return dividends + debtRepaid + equityIssued
    }
    var freeCashFlow: Double? {
        guard let operatingCashFlow = operatingCashFlow, let investingCashFlow = investingCashFlow else {
            return nil
        }
        return operatingCashFlow + investingCashFlow
    }
    var cashFlow: Double? {
        guard let operatingCashFlow = operatingCashFlow, let investingCashFlow = investingCashFlow, let financingCashFlow = financingCashFlow else {
            return nil
        }
        return operatingCashFlow + investingCashFlow + financingCashFlow
    }
    
    // Initializer
    init(netIncome: Double? = nil, depreciation: Double? = nil,changesInWorkingCapital: Double? = nil, capitalExpenditures: Double? = nil,investments: Double? = nil, dividends: Double? = nil, debtRepaid: Double? = nil, equityIssued: Double? = nil) {
        self.netIncome = netIncome
        self.depreciation = depreciation
        self.changesInWorkingCapital = changesInWorkingCapital
        self.capitalExpenditures = capitalExpenditures
        self.investments = investments
        self.dividends = dividends
        self.debtRepaid = debtRepaid
        self.equityIssued = equityIssued
    }
    
    // Mutating functions for modifying values
    func addNetIncome(_ amount: Double) {
        if netIncome == nil {
            netIncome = 0
        }
        netIncome! += amount
    }
    
    func addDepreciation(_ amount: Double) {
        if depreciation == nil {
            depreciation = 0
        }
        depreciation! += amount
    }
    
    func addChangesInWorkingCapital(_ amount: Double) {
        if changesInWorkingCapital == nil {
            changesInWorkingCapital = 0
        }
        changesInWorkingCapital! += amount
    }
    
    func addCapitalExpenditures(_ amount: Double) {
        if capitalExpenditures == nil {
            capitalExpenditures = 0
        }
        capitalExpenditures! += amount
    }
    
    func addInvestments(_ amount: Double) {
        if investments == nil {
            investments = 0
        }
        investments! += amount
    }
    
    func addDividends(_ amount: Double) {
        if dividends == nil {
            dividends = 0
        }
        dividends! += amount
    }
    
    func addDebtRepaid(_ amount: Double) {
        if debtRepaid == nil {
            debtRepaid = 0
        }
        debtRepaid! += amount
    }
    
    func addEquityIssued(_ amount: Double) {
        if equityIssued == nil {
            equityIssued = 0
        }
        equityIssued! += amount
    }
}
