//
//  ContentView.swift
//  caloryIntake
//
//  Created by Szoboszlai Soma on 2019. 10. 03..
//  Copyright © 2019. Szoboszlai Soma. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State var pickerSelectedItem = 0
    
    @State var dataPoints: [[CGFloat]] = [
        
        [ 50, 100, 150, 53, 32, 10, 59],
        [150, 100, 50, 60, 10, 30, 98],
        [20, 20, 30, 10, 70, 53, 95]
    ]
    
    var body: some View {
        ZStack {
            
            Color("appBackground").edgesIgnoringSafeArea(.all)
            
            VStack{
                Text("Avg Commits")
                .foregroundColor(Color("title"))
                    .font(.system(size: 34))
                    .fontWeight(.heavy)
                
                Picker(selection: $pickerSelectedItem, label: Text("")) {
                    Text("Week 1").tag(0)
                    Text("Week 2").tag(1)
                    Text("Week 3").tag(2)
                }.pickerStyle(SegmentedPickerStyle())
                    .padding(.horizontal, 24)
                
                
                HStack (spacing: 16) {
                    BarView(value: dataPoints[pickerSelectedItem][0])
                    BarView(value: dataPoints[pickerSelectedItem][1])
                    BarView(value: dataPoints[pickerSelectedItem][2])
                    BarView(value: dataPoints[pickerSelectedItem][3])
                    BarView(value: dataPoints[pickerSelectedItem][4])
                    BarView(value: dataPoints[pickerSelectedItem][5])
                    BarView(value: dataPoints[pickerSelectedItem][6])
                }.padding(.top, 24)
                    .animation(.default)
            }

    
        }
        
    }
}

struct BarView: View {
    
    var value: CGFloat
    
    var body: some View {
        VStack {
            ZStack (alignment: .bottom) {
                Capsule().frame(width: 30, height: 200)
                    .foregroundColor(Color(#colorLiteral(red: 0.2464039069, green: 0.5455842394, blue: 0.6027282403, alpha: 1)))
                Capsule().frame(width: 30, height: value)
                    .foregroundColor(.white)
            }
            Text("D").padding(.top, 8)
        }
    }
    
}
