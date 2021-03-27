//
//  LightView.swift
//  SwiftUITrafficLights
//
//  Created by Светлана Романенко on 27.03.2021.
//

import SwiftUI

struct LightView: View {
    private let color: Color
    private var indicator: Double
    
    var body: some View {
            Circle()
                .foregroundColor(color.opacity(indicator))
                .frame(width: 100, height: 100)
                .clipShape(Circle())
                .overlay(Circle().stroke(Color.white, lineWidth: 4))
    }
    
    init(color: Color, indicator: Double) {
        self.color = color
        self.indicator = indicator
    }
}
