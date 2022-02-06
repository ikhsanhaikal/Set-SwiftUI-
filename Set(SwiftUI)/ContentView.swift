//
//  ContentView.swift
//  Set(SwiftUI)
//
//  Created by Ikhsan on 06/02/2022.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Diamond()
            .stroke(lineWidth: 5)
            .aspectRatio(3/1.5, contentMode: .fit)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
