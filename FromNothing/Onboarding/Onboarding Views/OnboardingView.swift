//
//  OnboardingView.swift
//  DealHelper
//
//  Created by Remmington Damper on 1/13/23.
//

import SwiftUI
import AVFoundation
import YouTubeiOSPlayerHelper

//MARK: Start of Onboarding View, Displays the array, start of app entry
///This is the first actual screen of the app
struct OnboardingView: View {
    
    //TODO: - add error handling to this view

    //MARK: View Models
    ///This is viewmodel property manages the onboarding view
    @ObservedObject private var viewModel: OnboardingViewModel
    
    //MARK: Properties
    ///This is the generic error holder for all possible errors related to onboarding functions
    @State private var onboardingError: Error? = nil
    
    //MARK: Initializers
    init(viewModel: OnboardingViewModel) {
        self.viewModel = viewModel
    }
    
    //MARK: Start of View
    var body: some View {
        ZStack {
            //Neuromorphic background
            Color("mainbackgroundcolor")
                .ignoresSafeArea()
            ForEach(Array(zip(viewModel.items.indices, viewModel.items)), id: \.0) {
                (index, item) in
                ZStack {
                   
                    if viewModel.counter == index {
                        OnboardingItemView(viewModel: OnboardingItemViewModel(delegate: viewModel, item: viewModel.items[index]))
                    }
                }
            }
        }
        .task {
            do {
                //Handles fetching
                try await self.viewModel.fetchOnboardingItems()
            } catch let error {
                self.onboardingError = error
            }
        }
    }
}

struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView(viewModel: OnboardingViewModel(delegate: StartupViewModel(), service: OnboardingServiceImplementation()))
    }
}
