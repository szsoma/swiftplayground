//
//  NewDataView.swift
//  bmi_second
//
//  Created by Szoboszlai Soma on 2019. 11. 12..
//  Copyright © 2019. Szoboszlai Soma. All rights reserved.
//

import SwiftUI

struct NewDataView: View {
    
    var bmiStore: BmiStore
    @Environment(\.presentationMode) var presentationMode
    
    @State public var textHeight = ""
    @State public var textWeight = ""
    
    static let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .long
        return formatter
    }()
    
    var body: some View {
        Form {
           
            Section (header: Text("Add your values")){
                // Textfields inputs

              HStack {
                  TextField("Your Height in cm", text: $textHeight)
                      .textContentType(.oneTimeCode)
                      .keyboardType(.numberPad)
                  Text("cm").padding(.trailing, 20)
              }
              
              HStack {
                  TextField("Your Weight in kg", text: $textWeight)
                      .textContentType(.oneTimeCode)
                      .keyboardType(.numberPad)
                  Text("kg").padding(.trailing, 20)
              }
            }
            
            Button("Add") {
                self.bmiStore.bmis.append(Bmi(date: "2019.11.14", weight: self.textWeight, bmiData: self.bmiCalculate()))
              
                self.presentationMode.wrappedValue.dismiss()
            }
            .disabled(textWeight.isEmpty)
        }
    }
    
        
    func convertToDouble(s: String) -> Double {
        return ((s as NSString).doubleValue) / 100
    }
    
    func bmiCalculate() -> String {
        return String(format: "%.2f", 100 * (convertToDouble(s: textWeight) / pow(convertToDouble(s: textHeight), 2)))
    }
    
    
}

struct NewDataView_Previews: PreviewProvider {
    static var previews: some View {
        NewDataView( bmiStore: BmiStore() )
    }
}
