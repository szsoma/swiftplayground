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
    
    var body: some View {
        NavigationView {
            VStack {
                Text("BMI is a useful measurement for most people over 18 years old. But it is only an estimate and it doesn’t take into account age, gender and body composition.")
                .padding()
                .font(.system(size: 14))
                Section(header: Text("Your BMI History")) {
                    List {
                        ForEach(bmiStore.bmis) { bmiList in
                            HStack {
                                if isRightValue(v: bmiList.bmiData) == "thin" {
                                    Ellipse().fill(Color(.orange)).frame(width: 12, height: 12)
                                }
                                else if isRightValue(v: bmiList.bmiData) == "good" {
                                    Ellipse().fill(Color(.green)).frame(width: 12, height: 12)
                                }
                                else {
                                    Ellipse().fill(Color(.red)).frame(width: 12, height: 12)
                                }
                                
                                Text("\(bmiList.date)")
                                Spacer()
                                Text("\(bmiList.weight) kg").multilineTextAlignment(.leading)
                                Spacer()
                                Text("\(bmiList.bmiData)").multilineTextAlignment(.trailing)
                            }
                        }
                    }
                }
                
                Spacer()
            }
            .navigationBarTitle(Text("Body Mass Index"))
            .navigationBarItems(
//                leading: EditButton(),
                trailing:
                  Button(
                    action: { self.modalIsPresented = true }
                  ) {
                    HStack {
                        Image(systemName: "plus")
                        Text("New")
                    }
                  }
              )
            }
            .sheet(isPresented: $modalIsPresented) {
                NewDataView(bmiStore: self.bmiStore)
            }
        }
            
    }

func isRightValue(v: String) -> String {

    if (v as NSString).doubleValue < 20.5 {
            return "thin"
        } else if (v as NSString).doubleValue <= 26.5 {
            return "good"
        } else {
            return "overwight"
        }
    }


struct BmiCalculatorView_Previews: PreviewProvider {
    static var previews: some View {
        BmiCalculatorView(bmiStore: BmiStore())
    }
}
