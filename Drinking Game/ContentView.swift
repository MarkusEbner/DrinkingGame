//
//  ContentView.swift
//  Drinking Game
//
//  Created by Markus Private on 29.03.24.
//

import SwiftUI

struct ContentView: View {
    
    let size = 3
        
    @State private var randomNumber: Int = 0
    
    @State private var clickedArray: [Bool]
    
    @State private var showAlert = false

    
    init() {
        _randomNumber = State(initialValue: Int.random(in: 0..<size*size))
        _clickedArray = State(initialValue: [Bool](repeating: false, count: size*size))
    }

    
    func buttonPressed(loss: Bool, index: Int) {
        if (loss) {
            print("Du hast verloren")
            showAlert = true
        } else {
            print("Glück gehabt, weiter gehts")
            clickedArray[index] = true
        }
    }
    
    func restartGame() {
        showAlert = false
        clickedArray = [Bool](repeating: false, count: size*size)
        randomNumber = Int.random(in: 0..<size*size)
    }
    
    var body: some View {
        ZStack {
                   Color(.black)
                       .ignoresSafeArea()
                   VStack {
                       Text("Wähle eine Maß Bier")
                           .font(.title)
                           .foregroundStyle(.white)
                       ForEach(0..<size, id: \.self) { row in
                           HStack {
                               ForEach(0..<size,  id: \.self) { column in
                                   let index = row * size + column
                                   let pick = index == randomNumber
                                   Button(action: { buttonPressed(loss:pick, index: index) }) {
                                       if (clickedArray[index]) {
                                           Color.clear
                                               .frame(width: 120, height: 120)
                                       } else {
                                           if (pick) {
                                               Image("transparent_2024-03-29T13-30-07")
                                                   .resizable()
                                                   .frame(width: 120, height: 120)
                                                   .colorInvert()
                                           } else {
                                               Image("transparent_2024-03-29T13-30-07")
                                                   .resizable()
                                                   .frame(width: 120, height: 120)
                                           }
                                       }
                                   }
                                   .foregroundColor(.white) // Button text color
                               }
                           }
                       }
                   }
                   .padding()
                   .alert(isPresented: $showAlert) {
                       Alert(title: Text("Game Over Junge"),
                             message: Text("Du hast verloren"),
                             dismissButton: .default(Text("Restart"), action: {
                           restartGame()
                       }))
                   }
               }
           }
}

#Preview {
    ContentView()
}
