//
//  ContentView.swift
//  swiftUI-tutorial
//
//  Created by Szoboszlai Soma on 2019. 10. 09..
//  Copyright © 2019. Szoboszlai Soma. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
        VStack {
            
            //map
            MapView()
                .frame(height: 300)
                .edgesIgnoringSafeArea(.top)
            //image
            CircleImage().offset(y:-90).padding(.bottom, -90)
            
            VStack(alignment: .leading) {
                Text("Turtle Rock")
                    .font(.title)
                HStack {
                    Text("Joshua Tree National park")
                        .font(.subheadline)
                    Spacer()
                    Text("California")
                        .font(.subheadline)
                }
            }.padding()
            Spacer()
        }

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
