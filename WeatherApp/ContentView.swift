//
//  ContentView.swift
//  WeatherApp
//
//  Created by el houssaine el gamouz on 21/4/2025.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .padding()
    }
}

#Preview {
    WeatherView()
}
