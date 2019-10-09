//
//  ContentView.swift
//  i am rich
//
//  Created by Szoboszlai Soma on 2019. 10. 07..
//  Copyright © 2019. Szoboszlai Soma. All rights reserved.
//

import SwiftUI

struct ContentView: View {
  
    var image: Image {
        ImageStore.
    }
    
    var body: some View {
        
        ZStack {
            
            Color("appBackground").edgesIgnoringSafeArea(.all)
            
            VStack {
                Text("I am Rich")
                .foregroundColor(Color("title"))
                    .font(.system(size: 40))
                    .fontWeight(.heavy)
                
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
