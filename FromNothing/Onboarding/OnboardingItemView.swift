//
//  OnboardingItemView.swift
//  DealHelper
//
//  Created by Remmington Damper on 1/13/23.
//

import SwiftUI

struct OnboardingItemView: View {
    @Environment(\.colorScheme) var colorScheme
    @ObservedObject private var viewModel: OnboardingItemViewModel
    var offset = CGSize(width: 1325, height: 0)
    init(viewModel: OnboardingItemViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            Text(viewModel.item.title)
                .font(.headline)
                .fontWeight(.heavy)
                .foregroundColor(.primary)
                .shadow(radius: 2)
                .shadow(radius: 2)
                .lineLimit(nil)
                .multilineTextAlignment(.leading)
                .padding(.horizontal)
            Text(viewModel.item.description)
                .font(.subheadline)
                .fontWeight(.bold)
                .foregroundColor(.primary)
                .shadow(radius: 2)
                .shadow(radius: 2)
                .lineLimit(nil)
                .multilineTextAlignment(.leading)
                .padding(.horizontal)
            if let url = viewModel.item.url, let readyURL = URL(string: url)  {
                Text("You can visit the associated site url with this link: \(readyURL)")
                    .font(.caption)
                    .foregroundColor(.primary)
                    .shadow(radius: 1)
                    .shadow(radius: 1)
                    .multilineTextAlignment(.leading)
                    .lineLimit(nil)
            }
            CustomizedButton {
                withAnimation(.easeInOut(duration: 1.4).delay(0.18)) {
                    viewModel.didPressAndStack.toggle()
                }

            } content: {
                Text("Yes, I have read and understood Clear Acquire's instructions")
            }


            Spacer()
        }
        .padding()
        .withNeuromorphicBoxModifier(isDarkMode: colorScheme)
        .frame(width: 316, height: 499, alignment: .center)
        .offset(x: viewModel.didPressAndStack ? offset.width : 0, y: offset.height * 0.4)
        .rotationEffect(Angle(degrees: viewModel.didPressAndStack ? Double(offset.width / 15) : Double(0)))
        .scaleEffect(viewModel.didPressAndStack ? 0.25 : 1.0)
        .onTapGesture {
            viewModel.didPressAndStack = false
        }
    

    }
}

struct OnboardingItemView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingItemView(viewModel: OnboardingItemViewModel(item: try! OnboardingItem(from: [:] as! Decoder)))
    }
}
