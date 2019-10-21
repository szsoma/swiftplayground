//
//  ContentView.swift
//  dicee
//
//  Created by Szoboszlai Soma on 2019. 10. 14..
//  Copyright © 2019. Szoboszlai Soma. All rights reserved.
//

import SwiftUI

struct ContentView: View {

    @State var leftDiceNum = 1
    @State var rightDiceNum = 1
    
    var body: some View {
        
        ZStack {
            
            Image("bg-pattern")
                .resizable()
                .edgesIgnoringSafeArea(.all)

            VStack {
                Image("logo")
                Spacer()
                
                HStack {
                    DiceView(n: leftDiceNum)
                    DiceView(n: rightDiceNum)
                }
                .padding(.horizontal)
                Spacer()
                
                Button(action: {
                    self.leftDiceNum = Int.random(in: 1...6)
                    self.rightDiceNum = Int.random(in: 1...6)
                }) {
                    HStack {
                        Image(systemName: "play")
                        Text("Roll")
                            .fontWeight(.heavy)
                    }
                .padding()
                    .accentColor(.white)
                    .background(Color.green)
                    .cornerRadius(10)
                }
            }
            
            
        }
        
    }
    
}

struct DiceView: View {
    let n: Int
    var body: some View {
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
