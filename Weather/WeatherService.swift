//
//  WeatherService.swift
//  Weather
//
//  Created by Memory Mhou on 09/04/2023.
//

import Foundation
class WeatherAPI {
    let apiKey = "76b4c96bdd8626e24db18bdb859389aa"
    
    func getWeatherData(city: String, completion: @escaping (Weather?) -> Void) {
        let urlString = "https://api.openweathermap.org/data/2.5/weather?q=\(city)&units=metric&appid=\(apiKey)"
        guard let url = URL(string: urlString) else {
            completion(nil)
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data, error == nil else {
                completion(nil)
                return
            }
            
            do {
                let weatherData = try JSONDecoder().decode(WeatherData.self, from: data)
                let weather = Weather(temperature: weatherData.main.temp,
                                      humidity: weatherData.main.humidity,
                                      windSpeed: weatherData.wind.speed)
                completion(weather)
            } catch {
                completion(nil)
            }
        }.resume()
    }
}
