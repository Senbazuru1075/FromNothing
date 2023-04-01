//
//  MACRSTable.swift
//  FromNothing
//
//  Created by Remmington Damper on 3/17/23.
//

import Foundation

struct MACRSTable {
    let recoveryPeriod: Int
    let halfYearConvention: Bool
    
    func depreciationPercentages() -> [Double] {
        var percentages: [Double] = []
        let years = Double(recoveryPeriod)
        let doubleDecliningBalanceRate = 1.0 / years * 2
        
        if halfYearConvention {
            percentages.append(0.0)
        }
        
        for i in 1...Int(years) {
            var factor: Double = 0.0
            
            if halfYearConvention && i == 1 {
                factor = 0.5
            }
            
            if i == Int(years) {
                percentages.append(100.0 - percentages.reduce(0.0, +))
            } else {
                let numerator = years - Double(i) + 1 + factor
                let denominator = years * (years + 1) / 2
                let straightLinePercentage = numerator / denominator * 100
                let doubleDecliningPercentage = straightLinePercentage * doubleDecliningBalanceRate
                
                percentages.append(doubleDecliningPercentage)
            }
        }
        
        return percentages
    }
}
