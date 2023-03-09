//
//  SignupView.swift
//  DealHelper
//
//  Created by Remmington Damper on 1/13/23.
//

import SwiftUI
import GoogleSignIn
import GoogleSignInSwift

struct SignupView: View {
    @ObservedObject var viewModel: SignupViewModel
    @State var error: Error? = nil
    
    init(viewModel: SignupViewModel) {
        self.viewModel = viewModel
    }
    @Environment(\.colorScheme) var isDarkMode
    var body: some View {
        ZStack {
            Color("mainbackgroundcolor")
                .ignoresSafeArea()
            VStack {
                Image(systemName: "banknote.fill")
                    .resizable()
                    .foregroundColor(Color("moneycolor"))
                    
                    .scaledToFit()
                    .padding()
                    .padding()
                    .frame(width: 200, height: 200, alignment: .center)
                    .withNeuromorphicCircularModifier(isDarkMode: isDarkMode)
                    .padding(.top)
                    .padding(.bottom)
                
                Button {
                self.viewModel.resetOnboarding()
                } label: {
                    Text("Reset Onboarding")
                        .font(.title3)
                        .fontWeight(.bold)
                        .padding()
                        .padding(.horizontal)
                        .padding(.horizontal)
                        
                }
                .frame(width: 325, height: 70, alignment: .center)
                .buttonStyle(NeuroMorphicButtonStyle(isDarkMode: isDarkMode))
                .padding(.bottom)
              
                
                
                Spacer()
            }
        }
    }
}

struct SignupView_Previews: PreviewProvider {
    static var previews: some View {
        SignupView(viewModel: SignupViewModel(service: AuthServiceImplementation()))
    }
}
