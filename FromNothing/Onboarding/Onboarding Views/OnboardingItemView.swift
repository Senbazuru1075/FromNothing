//
//  OnboardingItemView.swift
//  DealHelper
//
//  Created by Remmington Damper on 1/13/23.
//

import SwiftUI
import AVFoundation

//MARK: Start of Onboarding Item View
///This view is for the express purpose of infornming the user about onboarding
struct OnboardingItemView: View {
    
    //MARK: Environment Variables
    @Environment(\.colorScheme) var colorScheme
    
    //MARK: View Models
    @ObservedObject private var viewModel: OnboardingItemViewModel
    
    //MARK: Properties
    var offset = CGSize(width: 1325, height: 0)
    
    //MARK: Initializers
    init(viewModel: OnboardingItemViewModel) {
        self.viewModel = viewModel
    }
    
    //MARK: Start of body
    var body: some View {
        
        if self.viewModel.item.video != nil {
            //MARK: Start of video VStack
            VStack {
                if let video = self.viewModel.item.video {
                    MoviePlayer(videoID: video)
                }
                CustomizedButton {
                    DispatchQueue.main.async {
                        withAnimation(.easeInOut(duration: 1.4).delay(0.18)) {
                            viewModel.didPressAndStack.toggle()
                            self.viewModel.verifyAndCount()
                        }
                    }
                } content: {
                    Text("Yes, I have read and understood Clear Acquire's instructions")
                }
            }
            .padding()
            .withNeuromorphicBoxModifier(isDarkMode: colorScheme)
            .frame(width: 316, height: 499, alignment: .center)
            .offset(x: viewModel.didPressAndStack ? offset.width : 0, y: offset.height * 0.4)
            .rotationEffect(Angle(degrees: viewModel.didPressAndStack ? Double(offset.width / 15) : Double(0)))
            .scaleEffect(viewModel.didPressAndStack ? 0.25 : 1.0)
            .opacity(viewModel.didPressAndStack ? 0 : 1)
        } else {
            //MARK: Start of Regular Onboarding card
            VStack(alignment: .leading, spacing: 20) {
                Text(viewModel.item.title ?? "")
                    .font(.headline)
                    .fontWeight(.heavy)
                    .foregroundColor(.primary)
                    .shadow(radius: 2)
                    .shadow(radius: 2)
                    .lineLimit(nil)
                    .multilineTextAlignment(.leading)
                    .padding(.horizontal)
                Text(viewModel.item.description ?? "")
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
                    DispatchQueue.main.async {
                        withAnimation(.easeInOut(duration: 1.4).delay(0.18)) {
                            viewModel.didPressAndStack.toggle()
                            self.viewModel.verifyAndCount()
                        }
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
            .opacity(viewModel.didPressAndStack ? 0 : 1)
        }
    }
}


