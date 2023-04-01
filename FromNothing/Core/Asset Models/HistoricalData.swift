//
//  HistoricalData.swift
//  FromNothing
//
//  Created by Remmington Damper on 3/16/23.
//

import Foundation

final class HistoricalData {
    var startDate: Date
    var endDate: Date
    var balanceSheets: BalanceSheet?
    
    init(startDate: Date, endDate: Date, balanceSheets: BalanceSheet? = nil) {
        self.startDate = startDate
        self.endDate = endDate
        self.balanceSheets = balanceSheets
    }
}
