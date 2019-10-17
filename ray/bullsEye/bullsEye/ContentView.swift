//
//  ContentView.swift
//  bullsEye
//
//  Created by Szoboszlai Soma on 2019. 10. 14..
//  Copyright © 2019. Szoboszlai Soma. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State var alertIsVisible = false
    @State var sliderValue = 50.0
    @State var target = Int.random(in: 1...100)
    @State var totalScr = 0
    @State var gameRound = 1
    
    var body: some View {
        VStack {
            Spacer()
            // Target Row
            HStack {
                Text("Put the bullseye as close as you can to:")
                Text("\(target)")
            }.padding()
            
            // Slider Row
            HStack {
                Text("1")
                Slider(value: $sliderValue, in: 1...100)
                Text("100")
            }.padding()
            
            //Button Row
            Button(action: {
                self.alertIsVisible = true
            }) {
            Text("Hit Me!")
            }
            .alert(isPresented: $alertIsVisible) { () -> Alert in
                return Alert(title: Text(alertTitle()), message: Text("The slider's value \(sliderValueRounded()).\n + You scored \(pointsForCurrentRound() )"), dismissButton: .default(Text("Awesome")) {
                    self.totalScr += self.pointsForCurrentRound()
                    self.target = Int.random(in: 1...100)
                    self.gameRound += 1
                    } )
            }
            Spacer()
            
            // Score Row
            HStack {
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/) {
                    Text("Start Over")
                }
                Spacer()
                Text("Score:")
                Text("\(totalScr)")
                Spacer()
                Text("Round:")
                Text("\(gameRound)")
                Spacer()
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/) {
                    Text("Info")
                }

            }.padding()
        }
        
    }
    
    func alertTitle() -> String {
        let diff = amountOff()
        let title: String
        if diff == 0 {
            title = "Perfect!"
        } else if diff < 5 {
            title = "You almost had it!"
        } else if diff <= 10 {
            title = "Not bad."
        } else {
            title = "Are you even trying?"
        }
        return title
    }
    
    func amountOff() -> Int {
        abs(target - sliderValueRounded())
    }
    
    func sliderValueRounded() -> Int {
        return Int(sliderValue.rounded())
    }
    
    func pointsForCurrentRound() -> Int {
        if amountOff() == 0 {
            return 100 - amountOff() + 100
        } else if amountOff() == 1 {
            return 100 - amountOff() + 50
        }
        return 100 - amountOff()

    }

}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().previewLayout(.fixed(width: 896, height: 414))
    }
}
