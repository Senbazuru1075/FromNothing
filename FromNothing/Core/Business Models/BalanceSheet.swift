//
//  BalanceSheet.swift
//  FromNothing
//
//  Created by Remmington Damper on 3/11/23.
//

import Foundation

//TODO: - Update functions and Fix and Add More Calculations

final class BalanceSheet {
    
    var assets: [Asset]?
    var liabilities: [Liabilities]?
    var equity: Double?
    var defaultCurrency: Currency
    var accountingMethod: AccountingMethod
    var segments: [BusinessSegment]?
    var currency: Currency
    
    init(assets: [Asset]?, liabilities: [Liabilities]?, equity: Double? = nil, defaultCurrency: Currency, accountingMethod: AccountingMethod = .accrual, segments: [BusinessSegment]?, currency: Currency) {
        self.assets = assets
        self.liabilities = liabilities
        self.equity = equity
        self.defaultCurrency = defaultCurrency
        self.accountingMethod = accountingMethod
        self.segments = segments
        self.currency = currency
    }
    
    func totalAssets() -> Double {
        guard let assets else { return 0 }
        var total: Double = 0
        for asset in assets {
            total += asset.value
        }
        return total
    }
    
//    func totalLiabilities() -> Double {
//        guard let liabilities else { return 0 }
//        var total: Double = 0
//        for liability in liabilities {
//            total += liability.total
//        }
//        return total
//    }
    
    func totalEquity() -> Double {
        return equity ?? 0
    }
    
//    func totalLiabilitiesAndEquity() -> Double {
//        return liabilities + equity
//    }
//
//    func netWorth() -> Double {
//        return assets - liabilities
//    }

}
