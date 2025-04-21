//
//  WeatherView.swift
//  WeatherApp
//
//  Created by el houssaine el gamouz on 21/4/2025.
//

import Foundation
import SwiftUI

struct WeatherView: View {
    @StateObject private var weatherViewModel = WeatherViewModel()
    
    var body: some View {
        VStack {
            TextField("Enter city", text: $weatherViewModel.city)
                .textFieldStyle(.roundedBorder)
                .padding()
            
            Button("Get Weather") {
                weatherViewModel.fetchWeather()
            }
            
            if let weather = weatherViewModel.weather {
                Text("Temperature:\(Int(weather.main.temp))°C")
                Text(weather.weather.first?.description.capitalized ?? "")
            } else if  let error = weatherViewModel.errorMessage {
                Text("Error: \(error)").foregroundColor(.red)
            }
        }
    }
    
}
