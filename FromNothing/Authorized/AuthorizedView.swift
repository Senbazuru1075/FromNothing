//
//  AuthorizedView.swift
//  DealHelper
//
//  Created by Remmington Damper on 1/13/23.
//

import SwiftUI

struct AuthorizedView: View {
   
    @ObservedObject var viewModel: AuthViewModel
    var body: some View {
        Text("Hello, World!")
        Text("Seeing if this works")
    }
}

struct AuthorizedView_Previews: PreviewProvider {
    static var previews: some View {
        AuthorizedView(viewModel: AuthViewModel())
    }
}
