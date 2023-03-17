//
//  IncomeStatement.swift
//  FromNothing
//
//  Created by Remmington Damper on 3/11/23.
//

import Foundation

final class IncomeStatement {
    
    var revenues: [Revenue]?
    
    var totalRevenue: Double {
        var totalAmount: Double = 0
        guard let revenues else { return 0}
        for value in revenues {
            if let result = value.revenueAmount {
                totalAmount += result
            }
        }
        return totalAmount
    }
    var costOfGoodsSold: [CostOfGoods]?
    
    var totalCostOfGoodsSold: Double {
        
        guard let costOfGoodsSold else { return 0 }
        var totalAmount: Double = 0
        
        for value in costOfGoodsSold {
            if let result = value.goodsAmount {
                totalAmount += result
            }
        }
        return totalAmount
    }
    var grossProfit: Double {
        return totalRevenue - totalCostOfGoodsSold
    }
    var operatingExpenses: [OperatingExpenses]?
    var totalOperatingExpenses: Double {
        guard let operatingExpenses else { return 0 }
        var totalAmount: Double = 0
        for value in operatingExpenses {
            if let result = value.operatingExpenseAmount {
                totalAmount += result
            }
        }
        return totalAmount
    }
    var operatingIncome: Double {
        return grossProfit - totalOperatingExpenses
    }
    var depreciation: Double?
    var amortization: Double?
    var ebitda: Double {
        return operatingIncome + (depreciation ?? 0) + (amortization ?? 0)
    }
    var interestIncome: Double?
    var interestExpense: Double?
    var otherIncome: Double?
    var otherExpenses: Double?
    var taxes: Double?
    var netIncome: Double {
        
        return operatingIncome + (interestIncome ?? 0) + (otherIncome ?? 0) - (interestExpense ?? 0) - (otherExpenses ?? 0) - (taxes ?? 0)
    }
     var nonRecurringItems: Double?
     var extraordinaryItems: Double?
    var grossMargin: Double {
        return grossProfit / totalRevenue
    }
    var operatingMargin: Double {
        return operatingIncome / totalRevenue
    }
    var returnOnEquity: Double {
        // Assuming a starting equity balance of 0
        return netIncome / totalRevenue
    }
    var year: Date?
    
    //MARK: Initializers
    init(revenues: [Revenue]?, costOfGoodsSold: [CostOfGoods]?, operatingExpenses: [OperatingExpenses]?, depreciation: Double = 0, amortization: Double = 0, interestIncome: Double = 0, interestExpense: Double = 0, otherIncome: Double = 0, otherExpenses: Double = 0, taxes: Double?, nonRecurringItems: Double = 0, extraordinaryItems: Double = 0, year: Date?) {
        self.revenues = revenues
        self.costOfGoodsSold = costOfGoodsSold
        self.operatingExpenses = operatingExpenses
        self.depreciation = depreciation
        self.amortization = amortization
        self.interestIncome = interestIncome
        self.interestExpense = interestExpense
        self.otherIncome = otherIncome
        self.otherExpenses = otherExpenses
        self.taxes = taxes
        self.nonRecurringItems = nonRecurringItems
        self.extraordinaryItems = extraordinaryItems
        self.year = year
    }
    
    func printStatement() {
        guard let revenues, let costOfGoodsSold, let operatingExpenses, let depreciation, let amortization, let year else { return }
        print("Income Statement for \(year)")
        print("====================================")
        for value in revenues {
            print("\(value.revenueTitle ?? ""): \(value.revenueAmount ?? 0)")
        }
        print("Total Revenue: \(totalRevenue)")
        print("------------------------------------")
        for value in costOfGoodsSold {
            
            print("\(value.goodsAmount ?? 0): \(value.goodsTitle ?? "")")
        }
        print("Total Cost of Goods Sold: \(totalCostOfGoodsSold)")
        print("------------------------------------")
        for value in operatingExpenses {
            print("\(value.operatingExpenseTitle ?? ""): \(value.operatingExpenseAmount ?? 0)")
        }
        print("Total Operating Expenses: \(totalOperatingExpenses)")
        print("------------------------------------")
        print("Gross Profit: \(grossProfit)")
        print("Depreciation: \(depreciation)")
        print("Amortization: \(amortization)")
        print("EBITDA: \(ebitda)")
        print("------------------------------------")
    }
}

