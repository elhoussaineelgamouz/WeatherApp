//
//  WeatherResponse.swift
//  WeatherApp
//
//  Created by el houssaine el gamouz on 21/4/2025.
//

import Foundation

struct WeatherResponse: Decodable {
    let main: Main
    let weather: [Weather]
    
    struct Main: Decodable {
        let temp: Double
    }
    
    struct Weather: Decodable {
        let description: String
        let icon: String
    }
}
