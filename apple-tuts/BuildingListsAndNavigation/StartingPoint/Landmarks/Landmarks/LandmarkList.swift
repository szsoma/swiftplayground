//
//  LandmarkList.swift
//  Landmarks
//
//  Created by Szoboszlai Soma on 2019. 10. 12..
//  Copyright © 2019. Apple. All rights reserved.
//

import SwiftUI

struct LandmarkList: View {
    var body: some View {
        
        List(landmarkData.identified(by: \.id)) {
            (landmark) -> LandmarkRow in
            LandmarkRow(landmark: landmark)
        }
        
    }
}

struct LandmarkList_Previews: PreviewProvider {
    static var previews: some View {
        LandmarkList()
    }
}
