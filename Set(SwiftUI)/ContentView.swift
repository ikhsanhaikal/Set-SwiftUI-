//
//  ContentView.swift
//  Set(SwiftUI)
//
//  Created by Ikhsan on 06/02/2022.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
//        VStack {
//            ZStack {
//                Image("squiggle")
//                    .border(.red)
//                Squiggle()
//                    .stroke(lineWidth: 3)
//                    .foregroundColor(.green)
//
//            }
//            Squiggle()
//                .stroke(lineWidth: 5)
//        }
        VStack {
            Diamond()
                .stroke(lineWidth: 5)
                .aspectRatio(3/1.5, contentMode: .fit)
            Squiggle()
                .stroke(lineWidth: 5)
                .foregroundColor(.red)
                .aspectRatio(3/2.7, contentMode: .fit)
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
