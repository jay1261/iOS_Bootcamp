//
//  ContentView.swift
//  HackerNews
//
//  Created by Jay on 2023/03/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView(){
            List(posts){ post in
                Text(post.title)
            }
            .navigationTitle("HackerNews")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct Post: Identifiable {
    let id: String
    let title: String
}

let posts = [
    Post(id: "1", title: "Hello"),
    Post(id: "2", title: "Hi"),
    Post(id: "3", title: "hihi")
]
