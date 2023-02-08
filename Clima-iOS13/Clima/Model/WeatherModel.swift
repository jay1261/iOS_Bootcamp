//
//  WeatherModel.swift
//  Clima
//
//  Created by DongJae Lee on 2023/02/01.
//  Copyright © 2023 App Brewery. All rights reserved.
//

import Foundation

struct WeatherModel{
    let weatherID: Int
    let cityName: String
    let temperature: Double
    
    var temperatureString: String{
        return String(format: "%.1f", temperature)
    }
    
    var conditionName: String{
        switch weatherID{
        case 200...299 :
            return "cloud.bolt"
        case 300...399 :
            return "cloud.drizzle"
        case 500...599 :
            return "cloud.rain"
        case 600...699 :
            return "cloud.snow"
        case 700...799 :
            return "cloud.fog"
        case 800 :
            return "sun.max"
        case 801...805 :
            return "cloud"
        default:
            return "error"
        }
    }
    
}
