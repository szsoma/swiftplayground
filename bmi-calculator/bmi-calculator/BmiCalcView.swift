//
//  bmiCalcView.swift
//  bmi-calculator
//
//  Created by Szoboszlai Soma on 2019. 10. 21..
//  Copyright © 2019. Szoboszlai Soma. All rights reserved.
//

import SwiftUI

struct bmiCalcView: View {
    
    @State private var gender = 0
    var genders = ["Female", "Male"]
    @State var weight = 0
    @State var height = 0
    @State private var age = 0
    var ages = [1, 2, 3, 4]
    
    var body: some View {
        NavigationView {
            VStack {
                // Gender segment
                Picker(selection: $gender, label: Text("Select your unit")) {
                    Text("Female").tag(0)
                    Text("Male").tag(1)
                }
                .pickerStyle(SegmentedPickerStyle())
                .padding()
                
                Form {
                    Picker(selection: $age, label: Text("Your Age")) {
                        ForEach(0 ..< ages.count) {
                            self.ages[$0]
                        }
                    }.pickerStyle(WheelPickerStyle())
                }
            }
        }
        .navigationBarTitle("Body Mass Calculator")
        
    }
}

struct bmiCalcView_Previews: PreviewProvider {
    static var previews: some View {
        bmiCalcView()
    }
}
