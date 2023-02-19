//
//  SignupView.swift
//  DealHelper
//
//  Created by Remmington Damper on 1/13/23.
//

import SwiftUI

struct SignupView: View {
    @ObservedObject var viewModel: SignupViewModel
    @Environment(\.colorScheme) var isDarkMode
    var body: some View {
        ZStack {
            Color("mainbackgroundcolor")
                .ignoresSafeArea()
            VStack {
                Image(systemName: "banknote.fill")
                    .resizable()
                    .foregroundColor(Color("moneycolor"))
                    .scaledToFill()
                    .padding()
                    .padding()
                    .frame(width: 125, height: 125, alignment: .top)
                    .withNeuromorphicCircularModifier(isDarkMode: isDarkMode)
                Spacer()
                
                Button {
                    self.viewModel.resetOnboarding()
                } label: {
                    Text("Reset Onboarding")
                }
                .withDefaultButtonModifier()
                Spacer()
            }
        }
    }
}

struct SignupView_Previews: PreviewProvider {
    static var previews: some View {
        SignupView(viewModel: SignupViewModel())
    }
}
