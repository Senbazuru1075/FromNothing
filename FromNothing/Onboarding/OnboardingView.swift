//
//  OnboardingView.swift
//  DealHelper
//
//  Created by Remmington Damper on 1/13/23.
//

import SwiftUI
import AVFoundation


struct OnboardingView: View {
    @ObservedObject private var viewModel: OnboardingViewModel
    @State private var error: Error? = nil
    init(viewModel: OnboardingViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        ZStack {
            ForEach(viewModel.items) {
                item in
                ZStack {
                        OnboardingItemView(viewModel: OnboardingItemViewModel(item: item))
                            .zIndex(1)
                }
            }
            VideoView(player: AVPlayer(url: viewModel.url))
                .zIndex(-1)
        }
        .task {
            do {
                try await self.viewModel.fetchOnboardingItems()
                try await self.viewModel.fetchOnboardingURL()
                
            } catch let error {
                self.error = error
            }
        }
    }
}

struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView(viewModel: OnboardingViewModel(service: FakeOnboardingServiceImplementation()))
    }
}
