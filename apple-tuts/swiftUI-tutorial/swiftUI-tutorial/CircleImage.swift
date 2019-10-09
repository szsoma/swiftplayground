//
//  CircleImage.swift
//  swiftUI-tutorial
//
//  Created by Szoboszlai Soma on 2019. 10. 09..
//  Copyright © 2019. Szoboszlai Soma. All rights reserved.
//

import SwiftUI

struct CircleImage: View {
    var body: some View {
        
        Image("yosemite").clipShape(Circle())
        .overlay(Circle().stroke(Color.gray, lineWidth: 2))
        .shadow(radius: 10)
        
        
    }
}

struct CircleImage_Previews: PreviewProvider {
    static var previews: some View {
        CircleImage()
    }
}
