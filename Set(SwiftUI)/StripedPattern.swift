//
//  StripedPattern.swift
//  Set(SwiftUI)
//
//  Created by Ikhsan on 11/02/2022.
//

import SwiftUI

struct StripedPattern: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        var posX: CGFloat = 0
        while posX < rect.maxX {
            path.addRect(CGRect(x: posX, y: 0.0, width: rect.width * 0.03, height: rect.height))
            posX += rect.width * 0.10
        }
        return path
    }
}

extension Shape {
    func striped() -> some View {
        ZStack {
            StripedPattern()
            self.stroke(lineWidth: 3)
        }
        .clipShape(self)
    }
}
