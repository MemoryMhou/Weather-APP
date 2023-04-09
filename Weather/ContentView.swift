//
//  ContentView.swift
//  Weather
//
//  Created by Memory Mhou on 09/04/2023.
//

import SwiftUI
struct ContentView: View {
    @State private var city: String = ""
    @State private var weather: Weather?
    
    let weatherAPI = WeatherAPI()
    
    var body: some View {
        VStack {
            TextField("Enter city name", text: $city)
                .padding()
                .textFieldStyle(RoundedBorderTextFieldStyle())
            
            Button(action: {
                weatherAPI.getWeatherData(city: city) { weather in
                    DispatchQueue.main.async {
                        self.weather = weather
                    }
                }
            }) {
                Text("Get Weather")
            }
            .padding()
            .foregroundColor(.white)
            .background(Color.blue)
            .cornerRadius(10)
            
            if let weather = weather {
                Text("Temperature: \(weather.temperature)°C")
                Text("Humidity: \(weather.humidity)%")
                Text("Wind Speed: \(weather.windSpeed) mph")
            }
        }
        .padding()
    }
}


