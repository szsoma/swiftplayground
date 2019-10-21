//
//  AboutView.swift
//  bullsEye
//
//  Created by Szoboszlai Soma on 2019. 10. 21..
//  Copyright © 2019. Szoboszlai Soma. All rights reserved.
//

import SwiftUI

struct AboutView: View {
    
    struct HeadingStyle: ViewModifier {
        func body(content: Content) -> some View {
            return content
                .font(Font.custom("Arial Rounded MT Bold", size: 30))
                .foregroundColor(Color.black)
                .padding(.vertical, 20)
        }
    }
    
    struct TextStyle: ViewModifier {
        func body(content: Content) -> some View {
            return content
                .font(Font.custom("Arial Rounded MT Bold", size: 16))
                .foregroundColor(Color.black)
                .padding(.trailing, 60)
                .padding(.leading, 60)
                .padding(.bottom, 20)
        }
    }
    var body: some View {
        
        VStack {
            Spacer()
            VStack{
                Text("🎯 Bullseye 🎯").modifier(HeadingStyle())
                Text("This is bullseye, the game where you can win points and earn fame by dragging a slider.").modifier(TextStyle()).lineLimit(nil)
                Text("Your goal is to place the slider as close as possible to the target value. The closer you are, the more points you score.").modifier(TextStyle())
                Text("Enjoy!").modifier(HeadingStyle())
            }
            .background(Color(red: 255.0 / 255.0, green: 214.0 / 255.0, blue: 179.0 / 255.0))
            .padding(.all, 20)
            Spacer()
        }
        .navigationBarTitle("About Bullseye")
        .background(
            Image("Background")
                .resizable()
                .scaledToFit()
        )
    }

}

struct AboutView_Previews: PreviewProvider {
    static var previews: some View {
        AboutView().previewLayout(.fixed(width: 896, height: 414))
    }
}
