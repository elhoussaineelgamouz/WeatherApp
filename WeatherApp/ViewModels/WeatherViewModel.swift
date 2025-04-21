//
//  WeatherViewModel.swift
//  WeatherApp
//
//  Created by el houssaine el gamouz on 21/4/2025.
//

import Foundation
import Combine

class WeatherViewModel: ObservableObject {
    
    @Published var city = ""
    @Published var weather: WeatherResponse?
    @Published var errorMessage: String?
    
    private var cancellables = Set<AnyCancellable>()
    private var service = WeatherService()
    
    func fetchWeather() {
        service.fetchWeather(for: city)
            .sink { completion in
                if case .failure(let error) = completion {
                    self.errorMessage = error.localizedDescription
                }
            } receiveValue: { weather in
                self.weather = weather
                self.errorMessage = nil
            }
            .store(in: &cancellables)
    }
}
