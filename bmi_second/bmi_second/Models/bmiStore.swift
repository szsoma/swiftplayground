//
//  bmiStore.swift
//  bmi_second
//
//  Created by Szoboszlai Soma on 2019. 11. 08..
//  Copyright © 2019. Szoboszlai Soma. All rights reserved.
//

import Combine

class BmiStore: ObservableObject {
    
    @Published var bmis = [
        Bmi(date: "2019.11.07", weight: "68", bmiData: "23.10", bmrData: 1541.25),
        Bmi(date: "2019.10.21", weight: "67.4", bmiData: "22.10", bmrData: 1541.25),
        Bmi(date: "2019.09.02", weight: "68.21", bmiData: "20.10", bmrData: 1541.25),
        Bmi(date: "2019.08.12", weight: "65.12", bmiData: "21.21", bmrData: 1541.25),
        Bmi(date: "2019.07.01", weight: "64", bmiData: "26.65", bmrData: 1523.25)
    ]

    
}
