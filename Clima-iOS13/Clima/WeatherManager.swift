//
//  WeatherManager.swift
//  Clima
//
//  Created by DongJae Lee on 2023/01/31.
//  Copyright © 2023 App Brewery. All rights reserved.
//

import Foundation

struct WeatherManager{
    let weatherURL = "https://api.openweathermap.org/data/2.5/weather?appid=9430b7bf738d3584d9d839b2ebbf2628&units=metric"
    
    func fetchWeather(cityName: String){
        let urlString = "\(weatherURL)&q=\(cityName)"
        print(urlString)
        performRequest(urlString: urlString)
    }
    
    func performRequest(urlString: String){
        
        // 1. Create a URL
        if let url = URL(string: urlString){
            // 2. Create a URLSession
            let session = URLSession(configuration: .default)
            // 3. Give the session a task
            let task = session.dataTask(with: url) { data, response, error in
                if error != nil{
                    print(error!)
                    return
                }
                
                if let safeData = data{
//                    let dataString = String(data: safeData, encoding: .utf8)
                    do{
                        let decodedData = try JSONDecoder().decode(WeatherData.self, from: safeData)
                        let id = decodedData.weather[0].id
                        let temp = decodedData.main.temp
                        let name = decodedData.name
                        
                        let weather = WeatherModel(weatherID: id, cityName: name, temperature: temp)
                        print(weather.temperatureString)
                        print(weather.conditionName)
                        print(weather)
                    }
                    catch{
                        print(error)
                    }
                    
                }
            }
            
            // 4. Start the task
            task.resume()
        }
        
    }
}
