//
//  APIManager.swift
//  Weather
//
//  Created by Memory Mhou on 09/04/2023.
//

import Foundation
func getWeatherData(completion: @escaping (WeatherData?, Error?) -> Void) {
    let apiKey = "your_api_key_here"
    let url = URL(string: "https://api.openweathermap.org/data/2.5/weather?q=Windhoek,uk&appid=\(apiKey)")!
    URLSession.shared.dataTask(with: url) { (data, response, error) in
        if let error = error {
            completion(nil, error)
        } else if let data = data {
            let decoder = JSONDecoder()
            do {
                let weatherData = try decoder.decode(WeatherData.self, from: data)
                completion(weatherData, nil)
            } catch {
                completion(nil, error)
            }
        }
    }.resume()
}
