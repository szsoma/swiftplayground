//
//  bmiCalcView.swift
//  bmi-calculator
//
//  Created by Szoboszlai Soma on 2019. 10. 21..
//  Copyright © 2019. Szoboszlai Soma. All rights reserved.
//

import Foundation
import SwiftUI
import Combine


struct bmiCalcView: View {
    
    @State var alertIsVisible = false
    @State private var gender = 0
    var genders = ["Female", "Male"]
    @State var weight = 0.0
    @State var height = 0.0
    @State var userAge = ""
    @State public var textHeight = ""
    @State public var textWeight = ""
    
    @State private var appUnit = 0
    var appUits = ["Metric", "Imperial"]
    
    struct bmi: Identifiable {
        var id = 1
        var type = Color.green
        var bmiValue = ""
        var bmiDate = Date()
    }
    
    static let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .long
        return formatter
    }()
    
    var modelData: [bmi] = []
        
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
    
    
    struct AdaptsToSoftwareKeyboard: ViewModifier {
          
        @State var currentHeight: CGFloat = 0
      
      
        func body(content: Content) -> some View {
            content
                .padding(.bottom, currentHeight).animation(.easeOut(duration: 0.25))
                .edgesIgnoringSafeArea(currentHeight == 0 ? Edge.Set() : .bottom)
                .onAppear(perform: subscribeToKeyboardChanges)
        }
      
        //MARK: - Keyboard Height
        private let keyboardHeightOnOpening = NotificationCenter.default
            .publisher(for: UIResponder.keyboardWillShowNotification)
            .map { $0.userInfo![UIResponder.keyboardFrameEndUserInfoKey] as! CGRect }
            .map { $0.height }
      
          
        private let keyboardHeightOnHiding = NotificationCenter.default
            .publisher(for: UIResponder.keyboardWillHideNotification)
            .map {_ in return CGFloat(0) }
          
        //MARK: - Subscriber to Keyboard's changes
          
        private func subscribeToKeyboardChanges() {
              
            _ = Publishers.Merge(keyboardHeightOnOpening, keyboardHeightOnHiding)
                .subscribe(on: RunLoop.main)
                .sink { height in
                    if self.currentHeight == 0 || height == 0 {
                        self.currentHeight = height
                    }
            }
        }
    }


    
    var body: some View {
        
        NavigationView {
            VStack {
                Image("BMI-female").padding()
                Text("BMI is a useful measurement for most people over 18 years old. But it is only an estimate and it doesn’t take into account age, gender and body composition.")
                    .padding()
                
                // Unit segment
                Text("Select your unit")
                Picker(selection: $appUnit, label: Text("Select your unit")) {
                   Text("Metric").tag(0)
                   Text("Imperial").tag(1)
                }
                .pickerStyle(SegmentedPickerStyle())
                .padding(.horizontal, 20)
                .padding(.bottom, 10)
                
                // Textfields inputs

                HStack {
                    TextField("Your Height in cm", text: $textHeight)
                        .textContentType(.oneTimeCode)
                        .keyboardType(.numberPad)
                        .modifier(TFieldStyle())
                    Text("cm").padding(.trailing, 20)
                }
                
                HStack {
                    TextField("Your Weight in kg", text: $textWeight)
                        .textContentType(.oneTimeCode)
                        .keyboardType(.numberPad)
                        .modifier(TFieldStyle())
                    Text("kg").padding(.trailing, 20)
                }

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
                        bmi(id: 1, type: self.bmiColor(), bmiValue: String(format: "%.2f", self.bmiCalculate()), bmiDate: Date())
                        }, secondaryButton: .default(Text("Okay")))
                    }
                .modifier(ButtonStyle())
                
                VStack {
                // 1.
                List(modelData) { bmiList in
                    HStack {
                        Text("\(bmiList.id)").padding(.trailing, 10)
                        Ellipse()
                            .fill(bmiList.type)
                            .frame(width: 12, height: 12)
                        Text("\(bmiList.bmiDate, formatter: Self.dateFormatter)")
                        Spacer()
                        VStack {
                            Text("\(bmiList.bmiValue)")
                        }
                    }
                    
                }
                    
                Spacer()
                
            }.modifier(AdaptsToSoftwareKeyboard())
            
        }
        .navigationBarTitle(Text("Body Mass Index"))
        .navigationBarItems(trailing: Button("Done") {
            //self.dismissKeyboard()
            
        })
        
    }
    
    func bmiColor() -> Color {
        let bmi = bmiCalculate()
        let color: Color
        
        if bmi < 20.5 {
            color = Color.red
        } else if bmi <= 26.5 {
            color = Color.green
        } else if bmi <= 31.9 {
            color = Color.orange
        } else if bmi <= 36.9 {
            color = Color.red
        } else {
            color = Color.red
        }
        return color
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
