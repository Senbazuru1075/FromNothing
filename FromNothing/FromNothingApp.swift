//
//  FromNothingApp.swift
//  FromNothing
//
//  Created by Remmington Damper on 2/15/23.
//

import SwiftUI
//TODO: - Add Time Period for Income Statement
//TODO: - Add Time Period for Balance Sheet
//TODO: - Add TIme Period for Cashflow Statement
//TODO: - Add and Expand Sensitivity Model and Calculations
//TODO: - Add Audit Stuff
//TODO: - Add Scenario Models and calculations
//TODO: - Add Benchmark Models and calculations
//TODO: - Add an Analysis Model and calculations
//TODO: - Check all models for TODOs
//TODO: - Expand and Add Forecast Model



@main
struct FromNothingApp: App {
    @StateObject var viewModel: StartupViewModel = StartupViewModel()
    @Environment(\.colorScheme) var isDarkMode: ColorScheme
    var body: some Scene {
        WindowGroup {
            StartupView(viewModel: viewModel, isDarkMode: isDarkMode)
               
        }
    }
}
