//
//  bmiStore.swift
//  bmi_second
//
//  Created by Szoboszlai Soma on 2019. 11. 08..
//  Copyright © 2019. Szoboszlai Soma. All rights reserved.
//

import Combine

class BmiStore: ObservableObject {
//    @Published var bmis = [
//        12.12,
//        32.13,
//        13.32
//        ].map { Bmi(bmiData: $0) }
    
    @Published var bmis = [
        Bmi(date: "2019.11.07", bmiData: 23.10),
        Bmi(date: "2019.10.21", bmiData: 22.10),
        Bmi(date: "2019.09.02", bmiData: 20.10),
        Bmi(date: "2019.08.12", bmiData: 21.21),
        Bmi(date: "2019.07.01", bmiData: 21.65)
    ]
}
