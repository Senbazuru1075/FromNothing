//
//  OnboardingView.swift
//  DealHelper
//
//  Created by Remmington Damper on 1/13/23.
//

import SwiftUI
import AVFoundation
import YouTubeiOSPlayerHelper

struct OnboardingView: View {
    @ObservedObject private var viewModel: OnboardingViewModel
    @State private var error: Error? = nil
    @State private var customPreferenceKey: Int? = 0
    
    
    init(viewModel: OnboardingViewModel) {
        self.viewModel = viewModel
    }
    
    struct CustomPreferenceKey: PreferenceKey {
        static var defaultValue: Int? = 0
        
        static func reduce(value: inout Int?, nextValue: () -> Int?) {
            value = nextValue()
        }
    }
    
    var body: some View {
        ZStack {
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
                try await self.viewModel.fetchOnboardingItems()
            } catch let error {
                self.error = error
            }
        }
    }
}

struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView(viewModel: OnboardingViewModel(delegate: StartupViewModel(), service: OnboardingServiceImplementation()))
    }
}
