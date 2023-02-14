//
//  CoinManager.swift
//  ByteCoin
//
//  Created by Angela Yu on 11/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

// https://rest.coinapi.io/v1/exchangerate/BTC/USD?apikey=8071E4DF-8D5A-49CE-BB7A-19999FB74D85
//Optional("{\n  \"time\": \"2023-02-14T05:52:52.0000000Z\",\n  \"asset_id_base\": \"BTC\",\n  \"asset_id_quote\": \"USD\",\n  \"rate\": 21732.421480802558418800249083\n}")

import Foundation

protocol CoinManagerDelegate {
    func didGetCoinPrice(_ coinData: CoinData)
    func didFailWithError(error: Error)
}

struct CoinManager {
    
    let baseURL = "https://rest.coinapi.io/v1/exchangerate/BTC"
    let apiKey = "8071E4DF-8D5A-49CE-BB7A-19999FB74D85"
    var delegate: CoinManagerDelegate?
    
    let currencyArray = ["AUD", "BRL","CAD","CNY","EUR","GBP","HKD","IDR","ILS","INR","JPY","MXN","NOK","NZD","PLN","RON","RUB","SEK","SGD","USD","ZAR"]

    func getCoinPrice(for currency: String){
        let urlString = "\(baseURL)/\(currency)?apikey=\(apiKey)"
        performRequest(with: urlString)
    }
    
    func performRequest(with urlString: String){
        if let url = URL(string: urlString){
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { data, response, error in
                if(error != nil){
                    print(error!)
                    
                }
                if let safeData = data{
                    if let coinData = parseJSON(safeData){
                        delegate?.didGetCoinPrice(coinData)
                    }
                }
            }
            task.resume()
        }
    }
    
    func parseJSON(_ data: Data) -> CoinData? {
        let decoder = JSONDecoder()
        do{
            let decodedData = try decoder.decode(CoinData.self, from: data)
            let time = decodedData.time
            let base = decodedData.asset_id_base
            let quote = decodedData.asset_id_quote
            let rate = decodedData.rate
            
            let coinData = CoinData(time: time, asset_id_base: base, asset_id_quote: quote, rate: rate)
            print(coinData.rate)
            
            return coinData
        }
        catch{
            delegate?.didFailWithError(error: error)
            return nil
        }
    }
    
}
