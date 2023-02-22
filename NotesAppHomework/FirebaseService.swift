//
//  FirebaseService.swift
//  NotesAppHomework
//
//  Created by Jakub Patelski on 15/02/2023.
//

import Foundation
import Firebase

class FirebaseService: ObservableObject {

    
    // Get a reference to the database
    let db = Firestore.firestore()
    @Published var list = [Item]()
       
       func addData(title: String) {
           
//           // Get a reference to the database
//           let db = Firestore.firestore()
           
           // Add a document to a collection
           db.collection("notes2").addDocument(data: ["title":title]) { error in
               
               // Check for errors
               if error == nil {
                   // No errors
                   
                   // Call get data to retrieve latest data
                   self.getData()
               }
               else {
                   // Handle the error
               }
           }
       }
       
       func getData() {

           // Get a reference to the database
//            let db = Firestore.firestore()

           // Read the documents at a specific path
           db.collection("notes2").getDocuments { snapshot, error in

               // Check for errors
               if error == nil {
                   // No errors

                   if let snapshot = snapshot {

                       // Update the list property in the main thread
                       DispatchQueue.main.async {

                           // Get all the documents and create Todos
                           self.list = snapshot.documents.map { d in

                               // Create a Todo item for each document returned
                               return Item(
                                           title: d["title"] as? String ?? "")
                           }
                       }


                   }
               }
               else {
                   // Handle the error
               }
           }
       }
    
}

