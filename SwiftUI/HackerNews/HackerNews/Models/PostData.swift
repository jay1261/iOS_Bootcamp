//
//  PostData.swift
//  HackerNews
//
//  Created by Jay on 2023/03/23.
//

import Foundation

struct Result: Decodable {
    let hits : [Post]
}

struct Post: Decodable, Identifiable{
    var id: String {
        return objectID
    }
    let points: Int
    let title: String
    let url: String?
    let objectID: String
}
