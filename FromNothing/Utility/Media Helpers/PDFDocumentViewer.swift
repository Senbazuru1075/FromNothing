//
//  PDFDocumentViewer.swift
//  ClearAcquire
//
//  Created by Remmington Damper on 9/29/22.
//

import SwiftUI
import PDFKit

struct PDFDocumentViewer: View {
    var url: URL
    @Environment(\.presentationMode) var presentationMode
    var isSingleSelectedPage: Bool
    var body: some View {
       
            PDFDocumentPresentedView(url: url, selectedPage: isSingleSelectedPage)
            .onTapGesture(count: 2) {
                presentationMode.wrappedValue.dismiss()
            }
            
    }
}

struct PDFDocumentViewer_Previews: PreviewProvider {
    static var previews: some View {
        PDFDocumentViewer(url: Bundle.main.url(forResource: "Document", withExtension: ".pdf")! , isSingleSelectedPage: true)
    }
}

struct PDFDocumentPresentedView: UIViewRepresentable {
    typealias UIViewType = PDFView
    
    let url: URL
    let selectedPage: Bool
    
    init(url: URL, selectedPage: Bool) {
        self.url = url
        self.selectedPage = selectedPage
    }
    
    func makeUIView(context: Context) -> PDFView {
        let view = PDFView()
        view.document = PDFDocument(url: url)
        view.autoScales = true
        if selectedPage {
            view.displayMode = .singlePageContinuous
        }
        return view
    }
    
    func updateUIView(_ uiView: PDFView, context: Context) {
        uiView.document = PDFDocument(url: url)
    }
    
}
