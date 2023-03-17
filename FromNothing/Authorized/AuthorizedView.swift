//
//  AuthorizedView.swift
//  DealHelper
//
//  Created by Remmington Damper on 1/13/23.
//

import SwiftUI

struct AuthorizedView: View {
    @ObservedObject var viewModel: AuthViewModel
    var body: some View {
        TabView {
            NavigationView {
                DealFormView()
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
        AuthorizedView(viewModel: AuthViewModel())
    }
}
