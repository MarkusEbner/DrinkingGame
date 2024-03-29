//
//  ContentView.swift
//  Drinking Game
//
//  Created by Markus Private on 29.03.24.
//

import SwiftUI

struct ContentView: View {
    
    let size = 3
    
    var randomIndex: Int {
            return Int.random(in: 0..<size*size)
        }
    
    func buttonPressed() {
        print("button pressed")
    }
    
    var body: some View {
        ZStack {
                   Color(.black)
                       .ignoresSafeArea()
                   VStack {
                       Text("Pick a beer mug")
                           .font(.title)
                           .foregroundStyle(.white)
                       let randomNumber = randomIndex
                       ForEach(0..<size, id: \.self) { row in
                           HStack {
                               ForEach(0..<size,  id: \.self) { column in
                                   let index = row * size + column
                                   Button(action: { buttonPressed() }) {
                                       if (index == randomNumber) {
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
                                   .foregroundColor(.white) // Button text color
                               }
                           }
                       }
                   }
                   .padding()
               }
           }
}

#Preview {
    ContentView()
}
