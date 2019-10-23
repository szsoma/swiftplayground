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
    @State private var userAge = ""
    @State private var userHeight = ""
    @State private var userWeight = ""
    
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
                    Section(header: Text("Your Info")) {
                        TextField("Your age", text: $userAge)
                        TextField("Your height", text: $userHeight)
                        TextField("Your Weight", text: $userWeight)
                    }

                }
            }
        }
        .navigationBarTitle(Text("Body Mass Calculator"), displayMode: .inline)
        
    }
}

struct bmiCalcView_Previews: PreviewProvider {
    static var previews: some View {
        bmiCalcView()
    }
}
