//
//  ContentView.swift
//  bmi-calculator
//
//  Created by Szoboszlai Soma on 2019. 10. 21..
//  Copyright © 2019. Szoboszlai Soma. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    struct navLinkStyle: ViewModifier {
        func body(content: Content) -> some View {
            return content
                .accentColor(.white)
                .padding()
                .background(Color.green)
                .cornerRadius(10)
                .padding(12)
        }
    }
    
    
    var body: some View {
        
        NavigationView {
            VStack {
                Text("Fitness Tracker v1.0")
                    .font(.largeTitle)
                Text("Complete Fitness tracker tool for weight loss")
                
                
                // Navigation buttons
                Spacer()
                HStack {
                    Spacer()
                    NavigationLink(destination: bmiCalcView()){
                        Text("BMI Calculator")
                    }
                    Spacer()
                }.modifier(navLinkStyle())
                
                HStack {
                    Spacer()
                    NavigationLink(destination: bmrCalcView()){
                        Text("BMR Calculator")
                    }
                    Spacer()
                }.modifier(navLinkStyle())
                
                HStack {
                    Spacer()
                    NavigationLink(destination: HistoryView()){
                        Text("History")
                    }
                    Spacer()
                }.modifier(navLinkStyle())
                
                HStack {
                    Spacer()
                    NavigationLink(destination: InfoView()){
                        Text("Info")
                    }
                    Spacer()
                }.modifier(navLinkStyle())

                
                Spacer()

            }

        }.navigationBarTitle("Fitness Tracker v1.0")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
