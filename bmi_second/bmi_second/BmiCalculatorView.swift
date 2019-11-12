//
//  BmiCalculatorView.swift
//  bmi_second
//
//  Created by Szoboszlai Soma on 2019. 11. 08..
//  Copyright © 2019. Szoboszlai Soma. All rights reserved.
//

import SwiftUI
import Combine
import Foundation

struct BmiCalculatorView: View {
    
    @State var alertIsVisible = false
    @State var modalIsPresented = false
    @ObservedObject var bmiStore: BmiStore
    
    static let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .long
        return formatter
    }()
    
    // Modifiers
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
            .padding(.horizontal, 30)
            .padding(.vertical, 15)
            .background(Color.blue)
            .cornerRadius(10)
            .padding(.vertical, 5)
        }
    }
    
    var body: some View {
        NavigationView {
            VStack {
                Text("BMI is a useful measurement for most people over 18 years old. But it is only an estimate and it doesn’t take into account age, gender and body composition.")
                    .padding()
                
                List {
                    ForEach(bmiStore)  { index in
                    }
                }
                               
//                   Button(action: {
//                       self.alertIsVisible = true
//                   }) {
//                       HStack {
//                           Image(systemName: "play")
//                           Text("Calculate!")
//                       }
//                   }
//                   .alert(isPresented: $alertIsVisible) { () -> Alert in
//                       return Alert(title: Text("Your body mass index is: \(bmiCalculate())"), message: Text(indexPrint()), primaryButton: .default(Text("Save my BMI")) {
//                           
//                           // Actions after Btn press
//                           // Need to develop
//                           }, secondaryButton: .default(Text("Okay")))
//                       }
                
                Spacer()
            }
            .navigationBarTitle(Text("Body Mass Index"))
            .navigationBarHidden(false)
            .navigationBarItems(trailing: Button("Done") {
//                self.dismissKeyboard()
            })
        }
            
    }

//    func indexPrint() -> String{
//        let bmi = bmiCalculate()
//        let title: String
//
//        if bmi < 20.5 {
//            title = "You have to gain muscle!"
//        } else if bmi <= 26.5 {
//            title = "This is a Perfect BMI!"
//        } else if bmi <= 31.9 {
//            title = "Warning! This is 1st type overweight!"
//        } else if bmi <= 36.9 {
//            title = "Warning! This is 2st type overweight!"
//        } else {
//            title = "Warning! This is 3st type overweight!"
//        }
//        return title
//    }
    
    func convertToDouble(s: String) -> Float {
        return ((s as NSString).floatValue) / 100
    }
    
//    func bmiCalculate() -> Float {
//        return 100 * (convertToDouble(s: textWeight) / pow(convertToDouble(s: textHeight), 2))
//    }
    
}

struct BmiCalculatorView_Previews: PreviewProvider {
    static var previews: some View {
        BmiCalculatorView(bmiStore: BmiStore())
    }
}
