//
//  NewBmrDataView.swift
//  bmi_second
//
//  Created by Szoboszlai Soma on 2019. 11. 13..
//  Copyright © 2019. Szoboszlai Soma. All rights reserved.
//

import SwiftUI

struct NewBmrDataView: View {
    
    var bmiStore: BmiStore
    @Environment(\.presentationMode) var presentationMode

    @State public var textHeight = ""
    @State public var textWeight = ""
    @State public var age = ""
    @State private var gender = 0
    var genders = ["Female", "Male"]
    
    var control = 0.0

    static let dateFormatter: DateFormatter = {
      let formatter = DateFormatter()
      formatter.dateStyle = .long
      return formatter
    }()
    
    var body: some View {
        Form {
            Section(header: Text("What is your gender?")) {
                Picker(selection: $gender, label: Text("What is your gender?")) {
                    ForEach(0..<genders.count) { index in
                        Text(self.genders[index]).tag(index)
                    }
                }
                .pickerStyle(SegmentedPickerStyle())
                .padding(.horizontal, 20)
            }
            
            Section(header: Text("Add your values")) {
                HStack {
                    TextField("Your height", text: $textHeight)
                        .textContentType(.oneTimeCode)
                        .keyboardType(.numberPad)
                    Text("cm").padding(.trailing, 20)
                }
                HStack {
                    TextField("Your weight", text: $textWeight)
                        .textContentType(.oneTimeCode)
                        .keyboardType(.numberPad)
                    Text("kg").padding(.trailing, 20)
                }
            }
            Section {
                HStack {
                    TextField("Your age", text: $age)
                        .textContentType(.oneTimeCode)
                        .keyboardType(.numberPad)
                    Text("years").padding(.trailing, 20)
                }
            }

            Section {
                Button("Add") {
                    if self.genders[self.gender] == "Male" {
                        self.bmiStore.bmis.append(Bmi(date: "2019.11.13", bmrData: self.bmrMale(a: self.age, h: self.textHeight, w: self.textWeight)))
                    }
                    else {
                        self.bmiStore.bmis.append(Bmi(date: "2019.11.13", bmrData: self.bmrFemale(a: self.age, h: self.textHeight, w: self.textWeight)))
                    }
                    
                    self.presentationMode.wrappedValue.dismiss()
                    print(self.bmiStore.bmis)
                }
                .disabled(age.isEmpty)
            }
        }
    }
    
    // functions
    
    func convertToDouble(s: String) -> Double {
           return (s as NSString).doubleValue
        
    }
    
    func bmrMale(a: String, h: String, w: String) -> Double {
        let height = 6.25 * convertToDouble(s: h)
        let weight = 10 * convertToDouble(s: w)
        let age = 5 * convertToDouble(s: a)
        
        return weight + height - age + 5
    }
    
    func bmrFemale(a: String, h: String, w: String) -> Double {
        return 10 * convertToDouble(s: w) + 6.25 * convertToDouble(s: h) - 5 * convertToDouble(s: a) - 161
    }
}

struct NewBmrDataView_Previews: PreviewProvider {
    static var previews: some View {
        NewBmrDataView(bmiStore: BmiStore() )
    }
}
