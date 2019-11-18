//
//  BmrCalculatorView.swift
//  bmi_second
//
//  Created by Szoboszlai Soma on 2019. 11. 08..
//  Copyright © 2019. Szoboszlai Soma. All rights reserved.
//

import SwiftUI

struct BmrCalculatorView: View {
    
    @State var alertIsVisible = false
    @State var modalIsPresented = false
    @ObservedObject var bmiStore: BmiStore
    
    var body: some View {
        NavigationView {
            VStack {
                Text("Basal Metabolic Rate represents your daily energy expenditure if your body is at rest all day. Look upon it as the minimum number of calories your body needs in order to function for 24 hours. ")
                    .padding()
                    .font(.system(size: 14))
                
                HStack {
                    Spacer()
                    VStack {
                        Text("Your last BMR is")
                        Text("\(String(format: "%.2f", bmiStore.bmis.last!.bmrData))").font(.title).bold()
                    }
                    Spacer()
                }
                .foregroundColor(.white)
                .padding()
                .background(Color.green)
                .cornerRadius(10)
                .padding(.horizontal)
                
                Form {
                    Section(header: Text("If you are sedentary (little or no exercise)")) {
                        Text("\(String(format: "%.2f", bmiStore.bmis.last!.bmrData * 1.2)) kcal / day").bold()
                    }
                    
                    Section(header: Text("If you are lightly active (light exercise or sports 1-3 days/week)")) {
                        Text("\(String(format: "%.2f", bmiStore.bmis.last!.bmrData * 1.375)) kcal / day").bold()
                    }
                    
                    Section(header: Text("If you are moderately active (moderate exercise 3-5 days/week)")) {
                        Text("\(String(format: "%.2f", bmiStore.bmis.last!.bmrData * 1.55)) kcal / day").bold()
                     }
                    
                    Section(header: Text("If you are very active (hard exercise 6-7 days/week)")) {
                        Text("\(String(format: "%.2f", bmiStore.bmis.last!.bmrData * 1.725)) kcal / day").bold()
                     }
                    
                    Section(header: Text("If you are super active (very hard exercise and a physical job)")) {
                        Text("\(String(format: "%.2f", bmiStore.bmis.last!.bmrData * 1.9)) kcal / day").bold()
                     }
                    
                }
                                    
                Spacer()
            }
            .navigationBarTitle(Text("Basal Metabolic Rate"))
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
                        NewBmrDataView(bmiStore: self.bmiStore)
        }

    }
}

struct BmrCalculatorView_Previews: PreviewProvider {
    static var previews: some View {
        BmrCalculatorView(bmiStore: BmiStore())
    }
}
