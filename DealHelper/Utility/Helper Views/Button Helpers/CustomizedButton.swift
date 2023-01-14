//
//  CustomizedButton.swift
//  Dreamquisition
//
//  Created by Remmington Damper on 9/22/22.
//

import SwiftUI

//MARK: Produceable
struct CustomizedButton<T: View>: View {
    var action: () -> ()
    @ViewBuilder let content: () -> T
    var body: some View {
        Button {
            action()
        } label: {
            content()
        }

    }
}

struct CustomizedButton_Previews: PreviewProvider {
    static var previews: some View {
        CustomizedButton(action: {}) {
            Text("Test")
        }
    }
}
