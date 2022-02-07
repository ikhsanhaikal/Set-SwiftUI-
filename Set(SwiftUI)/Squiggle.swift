//
//  Squiggle.swift
//  Set(SwiftUI)
//
//  Created by Ikhsan on 07/02/2022.
//

import SwiftUI

struct Squiggle: Shape {
    func path(in rect: CGRect) -> Path {
        let startAngle = Angle(degrees: 0 - 90)
        let endAngle = Angle(degrees: 1 - 90)
        
        var path = Path()
        //p1
//        path.addArc(
//            center: CGPoint(x: rect.width * 0.75, y: rect.height * 0.27),
//            radius: 8, startAngle: startAngle, endAngle: endAngle, clockwise: true)
//
        //p2
//        path.addArc(
//            center: CGPoint(x: rect.width * 0.4, y: rect.height * 0.33),
//            radius: 8, startAngle: startAngle, endAngle: endAngle, clockwise: true)
        
        //cp1
//        path.addArc(
//            center: CGPoint(x: rect.width * 0.65, y: rect.height * 0.4),
//            radius: 8, startAngle: startAngle, endAngle: endAngle, clockwise: true)
//
        path.move(to: CGPoint(x: rect.width * 0.73, y: rect.height * 0.275))
        path.addQuadCurve(to: CGPoint(x: rect.width * 0.4, y: rect.height * 0.35),control: CGPoint(x: rect.width * 0.63, y: rect.height * 0.45))
        
        //p3
//        path.addArc(
//            center: CGPoint(x: rect.width * 0.15, y: rect.height * 0.4),
//            radius: 8, startAngle: startAngle, endAngle: endAngle, clockwise: true)
        
        //cp2
//        path.addArc(
//            center: CGPoint(x: rect.width * 0.25, y: rect.height * 0.5),
//            radius: 8, startAngle: startAngle, endAngle: endAngle, clockwise: true)
        
        path.addQuadCurve(to: CGPoint(x: rect.width * 0.055, y: rect.height * 0.57), control: CGPoint(x: rect.width * 0.15 , y: rect.height * 0.26))
        
        //p4
//        path.addArc(
//            center: CGPoint(x: rect.width * 0.2, y: rect.height * 0.77),
//            radius: 8, startAngle: startAngle, endAngle: endAngle, clockwise: true)
        
        //cp3
//        path.addArc(
//            center: CGPoint(x: rect.width * 0, y: rect.height * 0.87),
//            radius: 8, startAngle: startAngle, endAngle: endAngle, clockwise: true)
        
        path.addQuadCurve(to: CGPoint(x: rect.width * 0.3, y: rect.height * 0.74), control: CGPoint(x: rect.width * 0.01 , y: rect.height * 0.87))
    
        //p5
//        path.addArc(
//            center: CGPoint(x: rect.width * 0.6, y: rect.height * 0.74),
//            radius: 8, startAngle: startAngle, endAngle: endAngle, clockwise: true)
        
        //cp4
//        path.addArc(
//            center: CGPoint(x: rect.width * 0.4, y: rect.height * 0.7),
//            radius: 8, startAngle: startAngle, endAngle: endAngle, clockwise: true)

        
        path.addQuadCurve(to: CGPoint(x: rect.width * 0.57, y: rect.height * 0.735), control: CGPoint(x: rect.width * 0.39 , y: rect.height * 0.68))

        
        //p6
//        path.addArc(
//            center: CGPoint(x: rect.width * 0.89, y: rect.height * 0.6),
//            radius: 8, startAngle: startAngle, endAngle: endAngle, clockwise: true)

        path.addQuadCurve(to: CGPoint(x: rect.width * 0.89, y: rect.height * 0.6), control: CGPoint(x: rect.width * 0.8 , y: rect.height * 0.78))

        //p7
//        path.addArc(
//            center: CGPoint(x: rect.width * 0.89, y: rect.height * 0.3),
//            radius: 8, startAngle: startAngle, endAngle: endAngle, clockwise: true)
        
        path.addQuadCurve(to: CGPoint(x: rect.width * 0.89, y: rect.height * 0.3), control: CGPoint(x: rect.width * 0.98 , y: rect.height * 0.4))
        
        //p8
//        path.addArc(
//            center: CGPoint(x: rect.width * 0.73, y: rect.height * 0.275),
//            radius: 8, startAngle: startAngle, endAngle: endAngle, clockwise: true)

        path.addQuadCurve(to: CGPoint(x: rect.width * 0.68, y: rect.height * 0.34), control: CGPoint(x: rect.width * 0.75 , y: rect.height * 0.21))
        
        path.closeSubpath()
        
        return path
    }
}



