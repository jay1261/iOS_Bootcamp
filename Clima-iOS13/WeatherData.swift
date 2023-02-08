//
//  WeatherData.swift
//  Clima
//
//  Created by DongJae Lee on 2023/02/01.
//  Copyright © 2023 App Brewery. All rights reserved.
//

import Foundation

struct WeatherData: Decodable{
    let name: String
    let main: Main
    let weather: [Weather]
}

struct Main: Decodable{
    let temp: Double
}

struct Weather: Decodable{
    let id: Int
    let main: String
    let description: String
    let icon: String
}
