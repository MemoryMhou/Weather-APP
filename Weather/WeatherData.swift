//
//  WeatherData.swift
//  Weather
//
//  Created by Memory Mhou on 09/04/2023.
//

import Foundation
struct WeatherData: Codable {
    let main: Main
    let wind: Wind
}

struct Main: Codable {
    let temp: Double
    let humidity: Double
}

struct Wind: Codable {
    let speed: Double
}
