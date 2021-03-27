//
//  ContentView.swift
//  SwiftUITrafficLights
//
//  Created by Светлана Романенко on 27.03.2021.
//

import SwiftUI

enum CurrentLight {
    case red, yellow, green
}

struct ContentView: View {
    private let shape = RoundedRectangle(cornerRadius: 5)
    private let lightIsOn = 1.0
    private let lightIsOff = 0.3
    
    
    @State private var redIndicator = 0.3
    @State private var yellowIndicator = 0.3
    @State private var greenIndicator = 0.3
    @State private var currentLight = CurrentLight.red
    @State private var text = "START"
    
    var body: some View {
        ZStack {
            Color.black
                .ignoresSafeArea()
            VStack {
                LightView(color: .red, indicator: redIndicator)
                LightView(color: .yellow, indicator: yellowIndicator)
                LightView(color: .green, indicator: greenIndicator)
                Spacer()
                Button(action: {
                    self.text = "NEXT"
                    self.buttonPressed()
                }) {
                    Text(text)
                        .foregroundColor(.white)
                        .frame(width: 150, height: 50)
                        .background(Color.blue)
                        .clipShape(shape)
                        .overlay(shape.stroke(Color.white, lineWidth: 4))
                }
            }
            .padding()
        }
    }
    
    private func buttonPressed() {
        switch currentLight {
        case .red:
            redIndicator = lightIsOn
            yellowIndicator = lightIsOff
            greenIndicator = lightIsOff
            currentLight = CurrentLight.yellow
        case .yellow:
            redIndicator = lightIsOff
            yellowIndicator = lightIsOn
            greenIndicator = lightIsOff
            currentLight = CurrentLight.green
        case .green:
            redIndicator = lightIsOff
            yellowIndicator = lightIsOff
            greenIndicator = lightIsOn
            currentLight = CurrentLight.red
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
