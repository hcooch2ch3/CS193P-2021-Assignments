//
//  ContentView.swift
//  Memorize
//
//  Created by 임성민 on 2021/10/31.
//

import SwiftUI

var vehicles = ["🚈", "🚗", "🛺", "✈️", "🚀", "🛴", "🚜", "🚛", "🏎", "⛵️", "🚁", "🛸"]
var animals = ["🐶", "🐱", "🐭", "🐹", "🐰", "🦊", "🐼", "🐻", "🦕", "🐬", "🐜", "🐌"]
var fruits = ["🍏", "🍎", "🍐", "🍊", "🍋", "🍌", "🍉", "🍇", "🍓", "🫐", "🍑", "🥑"]

struct ContentView: View {
    @State var emojis: [String] = vehicles
    
    var body: some View {
        VStack {
            Text("Memorize!")
                .font(.largeTitle)
            ScrollView {
                let randomCardCount = Int.random(in: 4..<emojis.count)
                let cardWidth = widthThatBestFits(cardCount: randomCardCount)
                LazyVGrid(columns: [GridItem(.adaptive(minimum: cardWidth))]) {
                    ForEach(emojis[0...randomCardCount], id: \.self) { emoji in
                        CardView(content: emoji).aspectRatio(2/3, contentMode: .fit)
                    }
                }
            }
            .foregroundColor(.red)
            Spacer()
            HStack(spacing: 30) {
                vehiclesButton
                animalsButton
                fruitsButton
                Spacer()
            }
            .font(.largeTitle)
            .padding(.horizontal)
        }
        .padding(.horizontal)
    }
    
    var vehiclesButton: some View {
        Button {
            emojis = vehicles.shuffled()
        } label: {
            VStack {
                Image(systemName: "car.fill")
                Text("Vehicles")
                    .font(.body)
            }
        }
    }
    
    var animalsButton: some View {
        Button {
            emojis = animals.shuffled()
        } label: {
            VStack {
                Image(systemName: "pawprint")
                Text("Animals")
                    .font(.body)
            }
        }
    }
    
    var fruitsButton: some View {
        Button {
            emojis = fruits.shuffled()
        } label: {
            VStack {
                Image(systemName: "applelogo")
                Text("Fruits")
                    .font(.body)
            }
        }
    }
    
    func widthThatBestFits(cardCount: Int) -> CGFloat {
        let normalWidth = CGFloat(65)
        let widthConstant = CGFloat(8.0/Float(cardCount))
        return normalWidth * widthConstant
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
.previewInterfaceOrientation(.portrait)
    }
}
