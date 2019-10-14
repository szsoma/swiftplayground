//
//  LandmarkRow.swift
//  Landmarks
//
//  Created by Szoboszlai Soma on 2019. 10. 12..
//  Copyright © 2019. Apple. All rights reserved.
//

import SwiftUI

struct LandmarkRow: View {
    var landmark: Landmark
    

    var body: some View {
        HStack {
            landmark.image
                .resizable()
                .frame(width: 50, height: 50)
            Text(landmark.name)
            Spacer()
        }.padding(.leading, 10)

    }
}

struct LandmarkRow_Previews: PreviewProvider {
    static var previews: some View {
        
        Group {
            LandmarkRow(landmark: landmarkData[0])
                .previewLayout(.fixed(width: 300, height: 70))
            LandmarkRow(landmark: landmarkData[1])
                .previewLayout(.fixed(width: 300, height: 70))
        }.previewLayout(.fixed(width: 300, height: 70))
        
       
    }
}
