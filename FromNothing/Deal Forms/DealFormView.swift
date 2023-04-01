//
//  DealFormView.swift
//  FromNothing
//
//  Created by Remmington Damper on 3/11/23.
//

import SwiftUI

struct DealFormView: View {
    @ObservedObject var viewModel: DealFormViewModel
    var isDarkMode: ColorScheme
    var body: some View {
        ZStack {
            Color("mainbackgroundcolor").ignoresSafeArea()
            VStack {
                
                Text("Add New Deal Information Here!")
                    .font(.title3)
                    .fontWeight(.bold)
                    .italic()
                    .padding(.vertical)
                
                DealFormSaveClearButtons(isDarkMode: isDarkMode, clearData: { viewModel.clearData() }, saveData: { viewModel.saveData() })
                
                List {
                    Section {
                        TextField("Business Name", text: $viewModel.businessName)
                        Text("Business Description")
                        TextEditor(text: $viewModel.businessDescription)
                        Text("Deal Description")
                    } header: {
                        Text("Business Basics")
                            .font(.title3)
                    }
                }
                .listRowInsets(.none)
                .background(Color("mainbackgroundcolor"))
            }
            .padding(.vertical, 20)
        }
    }
}

struct DealFormView_Previews: PreviewProvider {
    static var previews: some View {
        DealFormView(viewModel: DealFormViewModel(), isDarkMode: ColorScheme(.light)!)
    }
}

struct DealFormSaveClearButtons: View {
    var isDarkMode: ColorScheme
    var clearData: () -> Void
    var saveData: () -> Void
    var body: some View {
        HStack {
            Button {
                clearData()
            } label: {
                VStack {
                    Text("Clear")
                        .font(.callout)
                    Image(systemName: "trash")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 32, height: 32, alignment: .center)

                }
                .padding(.horizontal)
                .padding(.vertical)
            }
            .buttonStyle(NeuroMorphicButtonStyle(isDarkMode: isDarkMode))
            Spacer()
            
            Button {
                saveData()
            } label: {
                VStack {
                    Text("Save")
                        .font(.callout)
                    Image(systemName: "plus")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 32, height: 32, alignment: .center)
                }
                .padding(.horizontal)
                .padding(.vertical)
            }
            .buttonStyle(NeuroMorphicButtonStyle(isDarkMode: isDarkMode))

        }
        .padding(.horizontal, 20)
    }
}
