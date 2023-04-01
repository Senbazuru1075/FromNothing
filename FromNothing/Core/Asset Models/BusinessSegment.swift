//
//  BusinessSegment.swift
//  FromNothing
//
//  Created by Remmington Damper on 3/16/23.
//

import Foundation


final class BusinessSegment {
    var name: String?
    var balanceSheet: BalanceSheet?
    
    init(name: String?, balanceSheet: BalanceSheet?) {
        self.name = name
        self.balanceSheet = balanceSheet
    }
}
