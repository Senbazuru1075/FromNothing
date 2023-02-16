//
//  CustomizedTextField.swift
//  Dreamquisition
//
//  Created by Remmington Damper on 9/21/22.
//

import SwiftUI

//MARK: - Produceable and Complete

/// This is a neuromorphic styled TextField ready for usage with other buttons and functions and use cases
///
/// This function is designed to be neuromorphic. Neuromorphic designs do not always help inform the user about what to do. If you are using this helper file in another app. consider changing the Default modifier styling to make it fit with a design different than a neuromorphic design. Implementation is shown here.
///
/// ```
/// CustomizedTextField(enteredText: $theTextIwantToEnter, textFieldTitle: "The placeholder text I want to show in here")
/// ```
/// - warning: you only get a neuromorphic designed textfield. Use custom modifiers and custom creation if you don't want a neuromorphic design.
/// - parameter textFieldTitle: text field title is just that, the placeholder text for the textfield.
/// - parameter enteredText: entered text is for the text that you want to capture and use with a button or some other function or use case
/// - returns: a default stylized textfield to neuromorphic design with the ability to clear a string
struct CustomizedTextField: View {
    @Binding var enteredText: String
    var textFieldTitle: String
    
    var body: some View {
        
        TextField(textFieldTitle, text: $enteredText)
            .withDefaultTextFieldModifier(clearingString: $enteredText)
        
    }
}

struct CustomizedTextField_Previews:
    PreviewProvider {
    
    static var previews: some View {
        CustomizedTextField(enteredText: .constant("something"), textFieldTitle: "Something Here")
    }
}
