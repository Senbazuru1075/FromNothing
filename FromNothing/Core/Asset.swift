//
//  Asset.swift
//  FromNothing
//
//  Created by Remmington Damper on 3/17/23.
//

import Foundation

//TODO: - Expand Asset Class with method calculations 
class Asset {
    enum DepreciationMethod {
        case straightLine
        case decliningBalance
        case sumOfTheYearsDigits
        case unitsOfProduction
        case doubleDecliningBalance
        case macrs
        case acrs
        case other
    }
    
    enum AssetStatus {
        case active
        case disposed
    }

    enum AssetDisposalMethod {
        case sale
        case retirement
        case other
    }

    var name: String
    var value: Double
    var purchaseDate: Date
    var purchasePrice: Double
    var salvageValue: Double
    var lifeInYears: Double
    var depreciationMethod: DepreciationMethod
    var category: AssetCategory
    var status: AssetStatus = .active
    var disposalDate: Date?
    var disposalPrice: Double?
    var disposalMethod: AssetDisposalMethod?
    var accumulatedDepreciation: [Int: Double] = [:]

    init(name: String, value: Double, purchaseDate: Date, purchasePrice: Double, salvageValue: Double, lifeInYears: Double, depreciationMethod: DepreciationMethod, category: AssetCategory, status: AssetStatus, disposalDate: Date? = nil, disposalPrice: Double? = nil, disposalMethod: AssetDisposalMethod? = nil, accumulatedDepreciation: [Int : Double]) {
        self.name = name
        self.value = value
        self.purchaseDate = purchaseDate
        self.purchasePrice = purchasePrice
        self.salvageValue = salvageValue
        self.lifeInYears = lifeInYears
        self.depreciationMethod = depreciationMethod
        self.category = category
        self.status = status
        self.disposalDate = disposalDate
        self.disposalPrice = disposalPrice
        self.disposalMethod = disposalMethod
        self.accumulatedDepreciation = accumulatedDepreciation
    }
    
    func depreciation(forYear year: Date, fullUsefulLifeInYears: Double, totalUnitsOfProduction: Int = 0, recoveryPeriod: Int = 0, halfYearConvention: Bool = false) -> Double {
        var depreciation: Double = 0
        let depreciableAmount = purchasePrice - salvageValue
        
        switch depreciationMethod {
        case .straightLine:
            depreciation = (depreciableAmount / fullUsefulLifeInYears)
        case .decliningBalance:
            let rate = 1 / fullUsefulLifeInYears
            depreciation = (purchasePrice - salvageValue) * pow(rate, Double(year.timeIntervalSinceReferenceDate))
        case .sumOfTheYearsDigits:
            let sum = (fullUsefulLifeInYears * (fullUsefulLifeInYears + 1)) / 2
            depreciation = (depreciableAmount * (fullUsefulLifeInYears - Double(year.timeIntervalSinceReferenceDate) + 1) / sum)
        case .unitsOfProduction:
            let totalUnitsProduced = totalUnitsOfProduction
            depreciation = (depreciableAmount / Double(totalUnitsProduced)) * Double(year.timeIntervalSinceReferenceDate)
        case .doubleDecliningBalance:
            let rate = 2 / fullUsefulLifeInYears
            depreciation = (purchasePrice - salvageValue) * pow(rate, Double(year.timeIntervalSinceReferenceDate))
            if depreciation > (depreciableAmount - salvageValue) {
                depreciation = depreciableAmount - salvageValue
            }
        case .macrs:
            //TODO: - Needs Fixing
//            let macrsTable = MACRSTable(recoveryPeriod: 0, halfYearConvention: false)
//            let macrsRate = macrsTable.depreciationPercentages()
//            depreciation = (purchasePrice * macrsRate.first)
            break
        case .acrs:
            //TODO: - Needs Fixing
//            let acrsTable = ACRSTable()
//            let acrsRate = acrsTable.rate(forAssetCategory: category, usefulLifeInYears: usefulLifeInYears, year: year)
//            depreciation = (purchasePrice * acrsRate)
            break
        case .other:
            // Custom calculation for other depreciation methods
            break
        }

        return depreciation
    }
    
    func remainingLife(forYear year: Date) -> Double {
           guard status == .active else {
               return 0
           }

           let yearsElapsed = year.timeIntervalSinceReferenceDate - purchaseDate.timeIntervalSinceReferenceDate
           return max(lifeInYears - yearsElapsed, 0)
    }
        
        
        
        
}
