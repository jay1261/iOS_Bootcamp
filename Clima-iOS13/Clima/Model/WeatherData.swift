//
//  WeatherData.swift
//  Clima
//
//  Created by DongJae Lee on 2023/02/01.
//  Copyright © 2023 App Brewery. All rights reserved.
//

import Foundation

// JSON 디코딩하기 위해 Decodable 프로토콜 사용해야함
// 추가: Decodable, Encodable 을 합친게 Codable이다
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
