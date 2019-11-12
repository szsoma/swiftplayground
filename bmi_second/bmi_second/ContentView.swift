//
//  ContentView.swift
//  bmi_second
//
//  Created by Szoboszlai Soma on 2019. 11. 08..
//  Copyright © 2019. Szoboszlai Soma. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
                BmiCalculatorView()
                    .tabItem {
                        VStack {
                            Image(systemName: "dial")
                            Text(verbatim: "BMI")
                        }
                    }
                
                BmrCalculatorView()
                    .tabItem {
                        VStack {
                            Image(systemName: "perspective")
                            Text(verbatim: "BMR")
                        }
                }
                HistoryView()
                    .tabItem {
                        VStack {
                            Image(systemName: "calendar")
                            Text(verbatim: "History")
                        }
                }
                SettingsView()
                    .tabItem {
                        VStack {
                            Image(systemName: "gear")
                            Text(verbatim: "Settings")
                        }
                }
            }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
