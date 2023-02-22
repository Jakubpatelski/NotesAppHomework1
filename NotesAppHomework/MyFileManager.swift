//
//  MyFileManager.swift
//  NotesAppHomework
//
//  Created by Jakub Patelski on 15/02/2023.
//

import Foundation

//class MyFileManager: ObservableObject {
//    
//    let fService = FirebaseService()
//    let userDefaults = UserDefaults.standard
//   @Published var items = [Item]()//our local database
//    let arrayKey = "key"
//    
//    init() {
//
//        read()
//        
//    }
//    func addItem(text:String) {
//        items.append(Item(title: text))
//        save()
//    }
//    
//    func save(){
//        do{
//            let encodeData = try JSONEncoder().encode(items)
//            userDefaults.set(encodeData, forKey: arrayKey)
//        }catch{
//            print("broken")
//            
//        }
//        
//    }
//    
//    func read(){
//        if let result = userDefaults.object(forKey: arrayKey) as? Data {
//            
//            do {
//                let results = try JSONDecoder().decode([Item].self, from: result)
//                self.items = results
//                for i in items {
//                    print(i)//for debbuging
//                }
//            }catch {
//                
//            }
//        }
//    }
//}
