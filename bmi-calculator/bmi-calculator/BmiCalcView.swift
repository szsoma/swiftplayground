//
//  bmiCalcView.swift
//  bmi-calculator
//
//  Created by Szoboszlai Soma on 2019. 10. 21..
//  Copyright © 2019. Szoboszlai Soma. All rights reserved.
//

import SwiftUI

struct bmiCalcView: View {
    
    @State var alertIsVisible = false
    @State private var gender = 0
    var genders = ["Female", "Male"]
    @State var weight = 0.0
    @State var height = 0.0
    @State var userAge = ""
    @State public var textHeight = ""
    @State public var textWeight = ""
    
    struct TFieldStyle: ViewModifier {
    func body(content: Content) -> some View {
        return content
            .textFieldStyle(RoundedBorderTextFieldStyle())
            .padding(.horizontal)
            .padding(.vertical, 5)
        }
    }
    
    struct ButtonStyle: ViewModifier {
    func body(content: Content) -> some View {
        return content
            .accentColor(.white)
            .padding(20)
            .background(Color.blue)
            .cornerRadius(10)
            .padding(.vertical, 5)
        }
    }
    
    var body: some View {
        NavigationView {
            VStack {
                Spacer()
                Text("Fill the informations!")
                // Gender segment
                Picker(selection: $gender, label: Text("Select your unit")) {
                    Text("Female").tag(0)
                    Text("Male").tag(1)
                }
                .pickerStyle(SegmentedPickerStyle())
                .padding()
                
                // Textfields inputs
                                
                TextField("Your Height in cm", text: $textHeight).modifier(TFieldStyle())
                
                TextField("Your Weight in kg", text: $textWeight).modifier(TFieldStyle())
                
                Spacer()
                
                // Calculate Btn
                
                Button(action: {
                    self.alertIsVisible = true
                }) {
                    HStack {
                        Image(systemName: "play")
                        Text("Calculate!")
                    }
                }
                .alert(isPresented: $alertIsVisible) { () -> Alert in
                    return Alert(title: Text("Your body mass index is: \(bmiCalculate())"), message: Text(indexPrint()), primaryButton: .default(Text("Save my BMI")) {
                        // Actions after Btn press
                        }, secondaryButton: .default(Text("Okay")))
                    }
                .modifier(ButtonStyle())
                Spacer()

            }
        }
        .navigationBarTitle(Text("Body Mass Index calculator"), displayMode: .inline)

    }
    
    func indexPrint() -> String{
        let bmi = bmiCalculate()
        let title: String
        
        if bmi < 20.5 {
            title = "You have to gain muscle!"
        } else if bmi <= 26.5 {
            title = "This is a Perfect BMI!"
        } else if bmi <= 31.9 {
            title = "Warning! This is 1st type overweight!"
        } else if bmi <= 36.9 {
            title = "Warning! This is 2st type overweight!"
        } else {
            title = "Warning! This is 3st type overweight!"
        }
        return title
    }
    
    func convertToDouble(s: String) -> Float {
        return ((s as NSString).floatValue) / 100
    }
    
    func bmiCalculate() -> Float {
        return 100 * (convertToDouble(s: textWeight) / pow(convertToDouble(s: textHeight), 2))
    }
    
    
}

struct bmiCalcView_Previews: PreviewProvider {
    static var previews: some View {
        bmiCalcView()
    }
}
