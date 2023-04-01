//
//  AssetCategory.swift
//  FromNothing
//
//  Created by Remmington Damper on 3/16/23.
//

import Foundation


enum AssetCategory {
    
    case current(AssetSubcategory)
    case nonCurrent(AssetSubcategory)
}
enum AssetSubcategory {
    case cash(CashType)
    case cashEquivalents(CashEquivalentType)
    case shortTermInvestments(ShortTermInvestmentType)
    case accountsReceivable(AccountsReceivableType)
    case inventory(InventoryType)
    case prepaidExpenses
    case otherCurrentAssets(OtherCurrentAssetType)
    case land
    case buildings(BuildingType)
    case machineryAndEquipment(MachineryAndEquipmentType)
    case leaseholdImprovements
    case longTermInvestments(LongTermInvestmentType)
    case intangibleAssets(IntangibleAssetType)
    case otherNonCurrentAssets(OtherNonCurrentAssetType)
}

enum CashType {
    case physicalCash
    case pettyCash
    case cashInBank
    case otherCash
}

enum CashEquivalentType {
    case moneyMarketAccounts
    case treasuryBills
    case commercialPaper
    case certificatesOfDeposit
    case otherCashEquivalents
}

enum ShortTermInvestmentType {
    case marketableSecurities
    case governmentBonds
    case corporateBonds
    case mutualFunds
    case exchangeTradedFunds
    case otherShortTermInvestments
}

enum AccountsReceivableType {
    case trade(TermsOfSale)
    case nonTrade
    case otherAccountsReceivable
}

enum TermsOfSale {
    case net30
    case net60
    case net90
    case otherTerms
}

enum InventoryType {
    case rawMaterials
    case workInProgress
    case finishedGoods
    case merchandiseForResale
    case supplies
    case otherInventory
}

enum OtherCurrentAssetType {
    case prepaidRent
    case prepaidInsurance
    case prepaidTaxes
    case prepaidInterest
    case deferredRevenue
    case otherPrepaidExpenses
    case advancesToSuppliers
    case depositsWithVendors
    case receivableFromTaxAuthorities
    case receivableFromEmployees
    case otherReceivables
}

enum BuildingType {
    case office
    case retail
    case industrial
    case residential
    case otherBuildings
}

enum MachineryAndEquipmentType {
    case manufacturing
    case office
    case vehicles
    case furnitureAndFixtures
    case computerHardwareAndSoftware
    case otherMachineryAndEquipment
}

enum LongTermInvestmentType {
    case stock
    case bonds
    case realEstate
    case privateEquity
    case otherLongTermInvestments
}

enum IntangibleAssetType {
    case patents
    case trademarks
    case copyrights
    case franchises
    case licenses
    case goodwill
    case otherIntangibleAssets
}

enum OtherNonCurrentAssetType {
    case deferredTaxAssets
    case investmentsInJointVentures
    case investmentsInSubsidiaries
    case otherInvestments
    case longTermNotesReceivable
    case otherNotesReceivable
    case deferredCharges
    case otherNonCurrentAssets
}

enum LiabilityType {
  // Short-term liabilities
  case AccountsPayable
  case AccruedExpenses
  case ShortTermLoans
  case CreditCardDebt
  case TaxesPayable
  case DeferredRevenue
  case ShortTermPortionOfLongTermDebt
  
  // Long-term liabilities
  case LongTermLoans
  case LongTermNotesPayable
  case MortgagePayable
  case DeferredTaxLiabilities
  case DeferredCompensation
  case PensionLiabilities
  case OtherLongTermLiabilities
  
  // Contingent liabilities
  case PendingLawsuits
  case WarrantyClaims
  case ProductLiabilityClaims
  case EnvironmentalLiabilities
  case OtherContingentLiabilities
  
  // Computed property to get all cases
  static var allCases: [LiabilityType] {
    return [.AccountsPayable, .AccruedExpenses, .ShortTermLoans, .CreditCardDebt, .TaxesPayable, .DeferredRevenue, .ShortTermPortionOfLongTermDebt, .LongTermLoans, .LongTermNotesPayable, .MortgagePayable, .DeferredTaxLiabilities, .DeferredCompensation, .PensionLiabilities, .OtherLongTermLiabilities, .PendingLawsuits, .WarrantyClaims, .ProductLiabilityClaims, .EnvironmentalLiabilities, .OtherContingentLiabilities]
  }
}
