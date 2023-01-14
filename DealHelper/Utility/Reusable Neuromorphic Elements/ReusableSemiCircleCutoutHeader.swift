//
//  ReusableSemiCircleCutoutHeader.swift
//  FromNothing
//
//  Created by Remmington Damper on 12/8/22.
//

import SwiftUI

struct SemiCircleHeader: Shape {
    func path(in rect: CGRect) -> Path {
        Path {
            path in
            path.move(to: CGPoint(x: rect.maxX, y: rect.minY))
            path.addLine(to: .zero)
            path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY))
            path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
            path.addArc(center: CGPoint(x: rect.midX * 2, y: rect.midY), radius: rect.width / 1.5, startAngle: Angle(degrees: 90), endAngle: Angle(degrees: -90), clockwise: false)
            
        }
    }
}
struct ReusableSemiCircleCutoutHeader: View {
    var body: some View {
      SemiCircleHeader()
           
    }
}

struct ReusableSemiCircleCutoutHeader_Previews: PreviewProvider {
    static var previews: some View {
        ReusableSemiCircleCutoutHeader()
    }
}
