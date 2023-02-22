//
//  ContentView.swift
//  NotesAppHomework
//
//  Created by Jakub Patelski on 14/02/2023.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var model = FirebaseService()
    @State var title = ""
   
    var body: some View {
        VStack {
                        NavigationView {
                           
                            List {
                                ForEach($model.list) { item in
                                    NavigationLink(destination: DetailView(text: item.title)) {
                                        Text(item.title.wrappedValue)
                                    }
                                }
            
            
                                }

                           .navigationBarTitle("Notes")
                        }
            
            
            
            
            VStack(spacing: 20){
                TextField("Enter text", text: $title)
                
                    .padding()
                    .background(Color.gray.opacity(0.3).cornerRadius(10))
                    .foregroundColor(.black)
                    .font(.headline)
                
                Button {
                    
                    if(!title.isEmpty){
                        model.addData(title: title)
                        
                    }
                    
                    
                } label: {
                    Text("ADD NOTE")
                }
                
                .font(.headline)
                .accentColor(.white)
                .padding()
                .padding(.horizontal, 50)
                .background(Color.blue.cornerRadius(10).shadow(radius: 10))
                
            }
            
            
            .padding()
            
        }
        
    }
    
}
   


struct Item: Identifiable, Codable {
    var id = UUID()
    var title: String
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


