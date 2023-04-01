//
//  Forecast.swift
//  FromNothing
//
//  Created by Remmington Damper on 3/16/23.
//

import Foundation

final class Forecast {
    var startDate: Date
    var endDate: Date
    var balanceSheet: BalanceSheet?
    
    init(startDate: Date, endDate: Date, balanceSheet: BalanceSheet? = nil) {
        self.startDate = startDate
        self.endDate = endDate
        self.balanceSheet = balanceSheet
    }
}
