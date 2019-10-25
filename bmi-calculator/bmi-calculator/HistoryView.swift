//
//  HistoryView.swift
//  bmi-calculator
//
//  Created by Szoboszlai Soma on 2019. 10. 21..
//  Copyright © 2019. Szoboszlai Soma. All rights reserved.
//

import SwiftUI

struct HistoryView: View {
    
    
    struct bmi: Identifiable {
        var id = 1
        var type = Color.green
        var bmiValue = 0.0
        var bmiDate = Date()
    }
    
    static let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .long
        return formatter
    }()
    
    
    var modelData: [bmi] = [
        bmi(id: 1, type: Color.green, bmiValue: 23.9, bmiDate: Date()),
        bmi(id: 2, type: Color.red, bmiValue: 22.9, bmiDate: Date())
    ]
        
    
    
    var now = Date()

    var body: some View {
        NavigationView {
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
            }
        }.navigationBarTitle(Text("BMI History"))
    }
}

struct HistoryView_Previews: PreviewProvider {
    static var previews: some View {
        HistoryView()
    }
}
