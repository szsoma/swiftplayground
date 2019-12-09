//
//  ToDoItemView.swift
//  ToDoAppCD_v2
//
//  Created by Szoboszlai Soma on 2019. 12. 09..
//  Copyright © 2019. Szoboszlai Soma. All rights reserved.
//

import SwiftUI

struct ToDoItemView: View {
    
    var title:String = ""
    var createdAt:String = ""
    
    
    var body: some View {
        HStack{
            VStack(alignment: .leading) {
                Text(title)
                    .font(.headline)
                Text(createdAt)
                    .font(.caption)
            }
        }
    }
}

struct ToDoItemView_Previews: PreviewProvider {
    static var previews: some View {
        ToDoItemView()
    }
}
