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
        Text(landmark.name)
    }
}

struct LandmarkRow_Previews: PreviewProvider {
    static var previews: some View {
        LandmarkRow(landmark: landmarkData[1])
    }
}
