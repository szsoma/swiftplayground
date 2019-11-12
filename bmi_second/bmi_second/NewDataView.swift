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
    
    var body: some View {
        Form {
           
            Section {
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
//              let priorityIndex = self.taskStore.getIndex(for: self.prority)
//              
//              self.bmiStore.prioritizedTasks[priorityIndex].tasks.append(
//                Task(name: self.text)
//              )
              
              self.presentationMode.wrappedValue.dismiss()
            }
        }
    }
}

struct NewDataView_Previews: PreviewProvider {
    static var previews: some View {
        NewDataView( bmiStore: BmiStore() )
    }
}
