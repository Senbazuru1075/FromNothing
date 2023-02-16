//
//  ReusableStatsView.swift
//  Dreamquisition
//
//  Created by Remmington Damper on 12/20/22.
//

import SwiftUI
//
//struct ReusableStatsView: View {
//    @ObservedObject var vm: ProfileViewModel
//    @Environment(\.colorScheme) var colorScheme: ColorScheme
//    var body: some View {
//        NavigationLink {
//            ProfileView(profilevm: vm)
//        } label: {
//            VStack {
//                Text("Stats:")
//                    .font(.callout)
//                    .fontWeight(.semibold)
//                    .foregroundColor(.primary)
//                    .padding()
//                
//                HStack {
//                    
//                    Text("Elo: " + String(self.vm.profile.data?.eloRating.rating ?? 0))
//                        .font(.caption2)
//                        .fontWeight(.semibold)
//                        .foregroundColor(.primary)
//                    Text("Comm: " + (self.vm.profile.data?.commRanking.commRating.rawValue ?? ""))
//                        .font(.caption2)
//                        .fontWeight(.semibold)
//                        .foregroundColor(.primary)
//                    Text("Grind: " + (self.vm.profile.data?.grindRanking.ranking.rawValue ?? ""))
//                        .font(.caption2)
//                        .fontWeight(.semibold)
//                        .foregroundColor(.primary)
//                    Text("Safe: " + (self.vm.profile.data?.appSafety.rating.rawValue ?? ""))
//                        .font(.caption2)
//                        .fontWeight(.semibold)
//                        .foregroundColor(.primary)
//                    
//                }
//                
//            }
//            .padding()
//        }
//        .fixedSize(horizontal: true, vertical: true)
//        .buttonStyle(NeuroMorphicButtonStyle(isDarkMode: colorScheme))
//    }
//}

//struct ReusableStatsView_Previews: PreviewProvider {
//    static var previews: some View {
////        ReusableStatsView(profile: Profile(), profileEloRating: "750", profileCommRating: "extrovert", profileGrindRanking: "common", profileAppSafteyRanking: "honest")
//    }
//}
