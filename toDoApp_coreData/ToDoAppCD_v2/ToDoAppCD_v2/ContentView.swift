//
//  ContentView.swift
//  ToDoAppCD_v2
//
//  Created by Szoboszlai Soma on 2019. 12. 09..
//  Copyright © 2019. Szoboszlai Soma. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @Environment(\.managedObjectContext) var managedObjectContext
    @FetchRequest(fetchRequest: ToDoItem.getAllToDoItems()) var toDoItems: FetchedResults<ToDoItem>

    @State private var newTodoItem = ""
    
    var body: some View {
        NavigationView {
            List {
                Section(header: Text("Whats next?")) {
                    HStack{
                        TextField("New Item", text: self.$newTodoItem)
                        Button(action: {
                            let toDoItem = ToDoItem(context: self.managedObjectContext)
                            toDoItem.title = self.newTodoItem
                            toDoItem.createdAt = Date()
                            
                            do {
                                try self.managedObjectContext.save()
                            }catch {
                                print(error)
                            }
                            
                            self.newTodoItem = ""
                        }) {
                            Image(systemName: "plus.circle.fill")
                                .foregroundColor(.green)
                                .imageScale(.large)
                        }
                    }
                }.font(.headline)
                Section(header: Text("To Do's")) {
//                    Text("Gfdgsd")
                    ForEach(self.toDoItems) { todoItem in
                        ToDoItemView(title: todoItem.title!, createdAt: "\(todoItem.createdAt!)")
                    }.onDelete{IndexSet in
                        let deleteItem = self.toDoItems[IndexSet.first!]
                        self.managedObjectContext.delete(deleteItem)

                        do {
                            try self.managedObjectContext.save()
                        }catch {
                            print(error)
                        }
                    }
                }
            }
            .navigationBarTitle(Text("My list"))
            .navigationBarItems(trailing: EditButton())
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
