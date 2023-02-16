//
//  CustomNavigationContainer.swift
//  FromNothing
//
//  Created by Remmington Damper on 12/8/22.
//

import SwiftUI

struct CustomNeuromorphicNavigationContainer<ContainerContent:View>: View {
    var title: String
    var subtitle: String
    var ifShowBackButton: Bool
    var navigationContainerContent: ContainerContent
    
    init(title: String, subtitle: String, ifShowBackButton: Bool, @ViewBuilder navigationContainerContent: () -> ContainerContent) {
        self.title = title
        self.subtitle = subtitle
        self.ifShowBackButton = ifShowBackButton
        self.navigationContainerContent = navigationContainerContent()
    }
    var body: some View {
        ZStack(alignment:.top) {
            Color("mainbackgroundcolor").ignoresSafeArea()
            VStack(spacing: 0) {
                CustomNeuroMorphicNavBar(ifShowBackButton: true, title: title, subtitle: subtitle, toggleMenu: {})
                    .offset(y: -15)
                navigationContainerContent
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                Spacer()
            }
        }
    }
}

struct CustomNavigationContainer_Previews: PreviewProvider {
    static var previews: some View {
        CustomNeuromorphicNavigationContainer(title: "something", subtitle: "something else ", ifShowBackButton: true) {
            EmptyView()
            
        }
    }
}
