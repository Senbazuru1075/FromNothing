//
//  AuthorizedView.swift
//  DealHelper
//
//  Created by Remmington Damper on 1/13/23.
//

import SwiftUI

struct AuthorizedView: View {
    var isDarkMode: ColorScheme
    @ObservedObject var viewModel: AuthViewModel
    var body: some View {
        TabView {
            NavigationView {
                DealFormView(viewModel: DealFormViewModel(), isDarkMode: isDarkMode)
                    .navigationTitle("Deal Form")
            }
            NavigationView {
                LibraryView()
            }
            NavigationView {
                DueDiligenceView()
            }
            NavigationView {
                CalculatorsView()
            }
            NavigationView {
                DealAnalysisView()
            }
        }
    }
}

struct AuthorizedView_Previews: PreviewProvider {
    static var previews: some View {
        AuthorizedView(isDarkMode: ColorScheme(.light)!, viewModel: AuthViewModel())
    }
}
