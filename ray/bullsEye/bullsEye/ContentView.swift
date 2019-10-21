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
    let midnightBlue = Color(red: 0.0 / 255.0, green: 51.0 / 255.0, blue: 102.0 / 255.0)
    
    struct LabelShadow: ViewModifier {
        func body(content: Content) -> some View {
            return content
                .shadow(color: Color.black, radius: 5, x: 2, y: 2)
        }
    }
    
    struct ValueStyle: ViewModifier {
        func body(content: Content) -> some View {
            return content
                .foregroundColor(Color.yellow)
                .modifier(LabelShadow())
                .font(Font.custom("Arial Rounded MT Bold", size: 24))
        }
    }
    struct LabelStyle: ViewModifier {
        func body(content: Content) -> some View {
            return content
                .foregroundColor(Color.white)
                .modifier(LabelShadow())
                .font(Font.custom("Arial Rounded MT Bold", size: 18))
        }
    }
    
    struct BtnLargeTextStyle: ViewModifier {
        func body(content: Content) -> some View {
            return content
                .foregroundColor(Color.black)
                .font(Font.custom("Arial Rounded MT Bold", size: 18))
        }
    }
    
    struct BtnSmallTextStyle: ViewModifier {
        func body(content: Content) -> some View {
            return content
                .foregroundColor(Color.black)
                .font(Font.custom("Arial Rounded MT Bold", size: 12))
        }
    }

    
    var body: some View {
        VStack {
            Spacer()
            // Target Row
            HStack {
                Text("Put the bullseye as close as you can to:").modifier(LabelStyle())
                Text("\(target)").modifier(ValueStyle())

            }.padding()
            
            // Slider Row
            HStack {
                Text("1").modifier(LabelStyle())
                Slider(value: $sliderValue, in: 1...100).accentColor(Color.green)
                Text("100").modifier(LabelStyle())
            }.padding()
            
            //Button Row
            Button(action: {
                self.alertIsVisible = true
            }) {
                Text("Hit Me!").modifier(BtnLargeTextStyle())
            }
            .alert(isPresented: $alertIsVisible) { () -> Alert in
                return Alert(title: Text(alertTitle()), message: Text("The slider's value \(sliderValueRounded()).\n" + "You scored \(pointsForCurrentRound() )"), dismissButton: .default(Text("Awesome")) {
                    self.totalScr += self.pointsForCurrentRound()
                    self.target = Int.random(in: 1...100)
                    self.gameRound += 1
                    } )
                }
            .background(Image("Button")).modifier(LabelShadow())
            .padding(.vertical, 40)
            Spacer()
            
            // Score Row
            HStack {
                Button(action: {
                    self.startOver()
                }) {
                    HStack {
                        Image("StartOverIcon")
                        Text("Start Over").modifier(BtnSmallTextStyle())
                    }
                }.background(Image("Button")).modifier(LabelShadow())
                Spacer()
                Text("Score:").modifier(LabelStyle())
                Text("\(totalScr)").modifier(ValueStyle())
                Spacer()
                Text("Round:").modifier(LabelStyle())
                Text("\(gameRound)").modifier(ValueStyle())
                Spacer()
                NavigationLink(destination: AboutView()) {
                    HStack {
                        Image("InfoIcon")
                        Text("Info")
                    }
                }
                .background(Image("Button")).modifier(BtnSmallTextStyle())
                .padding(.horizontal, 20)
            }
            .padding(.all, 30)
        }
        .background(Image("Background").resizable(), alignment: .center)
        .accentColor(midnightBlue)
        .navigationBarTitle("Bullseye")
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
    
    func startOver() {
        totalScr = 0
        gameRound = 1
        target = Int.random(in: 1...100)
        sliderValue = 50
    }

}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().previewLayout(.fixed(width: 896, height: 414))
    }
}
