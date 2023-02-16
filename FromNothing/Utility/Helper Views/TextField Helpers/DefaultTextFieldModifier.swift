//
//  DefaultTextFieldModifier.swift
//  Dreamquisition
//
//  Created by Remmington Damper on 9/21/22.
//

import SwiftUI

// MARK: Produceable and Complete


/// Creates a stylized textfield modifier  with light grey/mint color, small rounded edges, and an option to clear input text trhough a binding
///
/// Default Text Field Modifier is used for styling all textfields that do not need to be different in any capacity. The effect of the design in this TextField Option is on a neuromorphic scale. You should use a differnt modifier if you want the text field to look different than neuromorphic. Implementation is shown below.
///
///```
/// .viewModifier(DefaultTextFieldModifier())
///```
///
/// - warning: there is no warning for this section
/// - parameter cleartext: use the cleartext binding to delete any entered text with the xmark symbol before submitting through the textfield.
/// - returns: creates a default styling for any textfield content
struct DefaultTextFieldModifier: ViewModifier {
    @Binding var clearText: String
    
    
    func body(content: Content) -> some View {
        content
            .foregroundColor(Color.primary)
            .padding()
            .background(Color("textfieldcolor"))
            .cornerRadius(16)
            .shadow(radius: 5)
            .frame(height: 75)
            .frame(maxWidth: .infinity)
            .overlay(
                Image(systemName: "xmark")
                    .foregroundColor(.primary)
                    .padding(.horizontal, 30)
                    .onTapGesture {
                        clearText = ""
                    }
                , alignment: .trailing)
    }
}
/// WithDefaultTextFieldModifier is an extension on view that saves time implementing the DefaultTextFieldModifier. It takes one parameter (stringToClear) that is a binding for a string to pass up the view hierarchy.
///
/// This implementation is a handy way of saving around 20 to 25 lines of code for creating a production ready textField. There are ways we can extend and change the textfield though. You should use this modifier in tandem with the CustomizedTextField struct for the view to create readymade textfields fast.
///
/// ```
/// .withDefaultTextFieldModifier(clearingString: $textIwantToClear)
/// ```
///
/// - warning: there is no warning for this section
/// - parameter stringToClear: use the stringToClear binding to get rid of any unwanted text in the textfield all at once.
/// - returns: creates a stylized textfield in a neuromorphic design.
extension View {
    
    func withDefaultTextFieldModifier(clearingString stringToClear: Binding<String>) -> some View {
        self.modifier(DefaultTextFieldModifier(clearText: stringToClear))
    }
}
