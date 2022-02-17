//
//  ContentView.swift
//  Set(SwiftUI)
//
//  Created by Ikhsan on 06/02/2022.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var viewModel = ViewModel()
    var body: some View {
        VStack {
            HStack {
                Spacer()
                HStack(alignment: .top, spacing: 2) {
                    Text("\(viewModel.points)")
                        .font(.largeTitle)
                    Text("pts")
                }
            }
            LazyVGrid(columns: [GridItem(.adaptive(minimum: 65))]) {
                ForEach(viewModel.playingCards) { card in
                    CardView(card: card)
                        .aspectRatio(2/3, contentMode: .fit)
                        .onTapGesture {
                            viewModel.choose(card)
                        }
                }
            }
            Spacer(minLength: 0)
        }
        .padding()
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
