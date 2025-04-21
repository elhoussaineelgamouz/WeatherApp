//
//  WeatherService.swift
//  WeatherApp
//
//  Created by el houssaine el gamouz on 21/4/2025.
//

import Foundation
import SwiftUI
import Combine

class WeatherService {
    func fetchWeather(for city: String) -> AnyPublisher<WeatherResponse, Error> {
        let cityEscaped = city.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? city
        let urlString = "https://api.openweathermap.org/data/2.5/weather?q=\(cityEscaped)&appid=YOUR_API_KEY&units=metric"
        let url = URL(string: urlString)!
        
        return URLSession.shared.dataTaskPublisher(for: url)
            .map(\.data)
            .decode(type: WeatherResponse.self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
}
