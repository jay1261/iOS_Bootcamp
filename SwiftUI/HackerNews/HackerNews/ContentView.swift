//
//  ContentView.swift
//  HackerNews
//
//  Created by Jay on 2023/03/22.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var networkManager = NetworkManager()
    
    var body: some View {
        NavigationView(){
            List(networkManager.posts){ post in
                HStack{
                    Text(String(post.points))
                    Text(post.title)
                }
            }
            .navigationTitle("HackerNews")
        }
        .onAppear {
            self.networkManager.fetchData()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

