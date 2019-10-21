//
//  ContentView.swift
//  bmi-calculator
//
//  Created by Szoboszlai Soma on 2019. 10. 21..
//  Copyright © 2019. Szoboszlai Soma. All rights reserved.
//

import SwiftUI

struct ContentView: View {

    @State private var appUnit = 0
    var appUits = ["Metric", "Imperial"]
    
    struct navLinkStyle: ViewModifier {
        func body(content: Content) -> some View {
            return content
                .background(Color.blue)
                .foregroundColor(Color.white)
                .padding(.all)
        }
    }
    
    var body: some View {
        
        NavigationView {
            VStack {
                Text("Fitness Tracker v1.0")
                Text("Complete Fitness tracker tool for weight loss")
                
                // Unit segment
                Picker(selection: $appUnit, label: Text("Select your unit")) {
                    Text("Metric").tag(0)
                    Text("Imperial").tag(1)
                }
                .pickerStyle(SegmentedPickerStyle())
                .padding()
                Spacer()
                
                
                // Navigation buttons
                HStack {
                    NavigationLink(destination: bmiCalcView()){
                        Text("BMI Calculator")
                    }.modifier(navLinkStyle())
                    
                    NavigationLink(destination: bmrCalcView()){
                        Text("BMR Calculator")
                    }
                }
                
                HStack {
                    NavigationLink(destination: HistoryView()){
                        Text("BMI Calculator")
                    }
                    
                    NavigationLink(destination: InfoView()){
                        Text("BMr Calculator")
                    }
                }
                Spacer()

            }

        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
