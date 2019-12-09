//
//  ToDoItem.swift
//  ToDoAppCD_v2
//
//  Created by Szoboszlai Soma on 2019. 12. 09..
//  Copyright © 2019. Szoboszlai Soma. All rights reserved.
//

import SwiftUI
import CoreData

public class ToDoItem: NSManagedObject, Identifiable {
    @NSManaged public var createdAt:Date?
    @NSManaged public var title:String?
}

extension ToDoItem {
    static func getAllToDoItems() -> NSFetchRequest<ToDoItem> {
        let request:NSFetchRequest<ToDoItem> = ToDoItem.fetchRequest() as! NSFetchRequest<ToDoItem>
        
        let sortDescriptor = NSSortDescriptor(key: "createdAt", ascending: true)
        
        request.sortDescriptors = [sortDescriptor]
        
        return request
    }
}
