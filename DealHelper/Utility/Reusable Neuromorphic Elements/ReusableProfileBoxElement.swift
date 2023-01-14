//
//  ReusableProfileBoxElement.swift
//  FromNothing
//
//  Created by Remmington Damper on 12/8/22.
//

import SwiftUI

//TODO: Switch Everything out for a profile Model Object
//struct ReusableProfileBoxElement: View {
//    @Environment(\.colorScheme) var colorScheme
//    var profilevm: ProfileViewModel
//    
//    init(profilevm: ProfileViewModel) {
//        self.profilevm = profilevm
//    }
//    
//    var body: some View {
//       
//            
//            VStack(alignment: .leading, spacing: 0) {
//                HStack {
//                    
//                    
//                }
//                    .font(.title2.bold())
//                    .multilineTextAlignment(.leading)
//                Text(self.profilevm.profile.data?.username ?? "")
//                    .font(.callout)
//                    .fontWeight(.semibold)
//                    .multilineTextAlignment(.leading)
//                
//                }
//            .padding()
//            .padding(.bottom)
//            .withNeuromorphicBoxModifier(isDarkMode: colorScheme)
//        
//    }
//}
//
//struct ReusableProfileBoxElement_Previews: PreviewProvider {
//    static var previews: some View {
//        ReusableProfileBoxElement(profilevm: ProfileViewModel(profileService: FakeProfileService()))
//        
//    }
//}
