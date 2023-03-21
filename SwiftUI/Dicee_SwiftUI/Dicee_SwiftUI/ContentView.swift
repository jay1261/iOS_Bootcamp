//
//  ContentView.swift
//  Dicee_SwiftUI
//
//  Created by Jay on 2023/03/21.
//

import SwiftUI

struct ContentView: View {
    @State var leftDiceNumber : Int = 1
    @State var rightDiceNumber : Int = 1
    
    var body: some View {
        ZStack{
            Image("background")
                .resizable()
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                Image("diceeLogo")
                Spacer()
                HStack(spacing: 20.0){
                    DiceView(n: leftDiceNumber)
                    DiceView(n: rightDiceNumber)
                }
                Spacer()
                Button("Roll") {
                    leftDiceNumber = Int.random(in: 1...6)
                    rightDiceNumber = Int.random(in: 1...6)
                }
                .font(.system(size: 40))
                .fontWeight(.heavy)
                .foregroundColor(.white)
                .padding(.horizontal)
                .background(Color.red)
                
                
                
            }
            .padding()
        }
    }
}

struct DiceView: View{
    let n : Int
    var body: some View{
        Image("dice\(n)")
            .resizable()
            .aspectRatio(1, contentMode: .fit)
            .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
