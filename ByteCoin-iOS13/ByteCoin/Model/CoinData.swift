//
//  CoinData.swift
//  ByteCoin
//
//  Created by DongJae Lee on 2023/02/14.
//  Copyright © 2023 The App Brewery. All rights reserved.
//

import Foundation

struct CoinData: Codable {
    let time: String
    let asset_id_base: String
    let asset_id_quote: String
    let rate: Double
    
    var rateString: String {
        return String(format: "%.1f", rate)
    }
}
