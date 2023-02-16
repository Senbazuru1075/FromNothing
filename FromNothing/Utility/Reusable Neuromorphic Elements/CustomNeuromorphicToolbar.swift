//
//  CustomNeuromorphicToolbar.swift
//  FromNothing
//
//  Created by Remmington Damper on 12/8/22.
//

import Foundation
import SwiftUI
//
//struct CustomNeuromorphicToolbarModifier: ViewModifier {
//    var isDarkMode: ColorScheme
//    var navigationTitle: String
//    var navigationSubtitle: String
//    @ObservedObject var profilevm: ProfileViewModel
//    func body(content: Content) -> some View {
//        content
//            .toolbar(.visible, for: .navigationBar)
//            .toolbar {
//                ToolbarItemGroup(placement: .automatic) {
//                    
//                        HStack(spacing: 35) {
//                            Spacer()
//                            VStack {
//                                Text(navigationTitle)
//                                    .font(.title3)
//                                    .fontWeight(.semibold)
//                                    .foregroundColor(.primary)
//                                    .shadow(radius: 1)
//                                    .shadow(radius: 2)
//                                    .multilineTextAlignment(.center)
//                                    .lineLimit(1)
//                                Text(navigationSubtitle)
//                                    .font(.headline)
//                                    .fontWeight(.light)
//                                    .foregroundColor(.primary)
//                                    .shadow(radius: 1)
//                                    .shadow(radius: 2)
//                                    .multilineTextAlignment(.center)
//                                    .lineLimit(1)
//                                
//                            }
//                            .fixedSize(horizontal: true, vertical: true)
//                            Spacer()
//                            
//                            NavigationLink {
//                                SideMenu(profilevm: profilevm)
//                            } label: {
//                                Image(systemName: "contextualmenu.and.cursorarrow")
//                                    .resizable()
//                                    .renderingMode(.template)
//                                    .padding()
//                                    .scaledToFill()
//                                    .frame(width: 57, height: 57)
//                            }
//                            .frame(width: 57, height: 57)
//                            .buttonStyle(CircularNeuroMorphicStyle(isDarkMode: isDarkMode))
//                            .buttonStyle(CircularNeuroMorphicStyle(isDarkMode: isDarkMode))
//                            
//                            Spacer()
//                            
//                        }
//                        .padding()
//                        .withNeuromorphicBoxModifier(isDarkMode: isDarkMode)
//                        .frame(maxWidth: .infinity)
//                    
//                    
//                }
//            }
//    }
//}
//
//extension View {
//
//    func withCustomNeuromorphicToolbar(isDarkMode: ColorScheme, navigationTitle: String, navigationSubtitle: String, profilevm: ProfileViewModel) -> some View {
//        self.modifier(CustomNeuromorphicToolbarModifier(isDarkMode: isDarkMode, navigationTitle: navigationTitle, navigationSubtitle: navigationSubtitle, profilevm: profilevm))
//    }
//}
