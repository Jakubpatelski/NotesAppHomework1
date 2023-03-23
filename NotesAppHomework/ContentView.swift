//
//  ContentView.swift
//  NotesAppHomework
//
//  Created by Jakub Patelski on 14/02/2023.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var model = FirebaseService()
    @State var showNewScreen: Bool = false
    @State var title = ""
    
    var body: some View {
       
                NavigationView {
                    VStack {
                    List {
                        Section("Notes"){
                            
                            ForEach($model.list) { item in
                                NavigationLink(destination: DetailView(text: item.title, note: item.wrappedValue)) {
                                    Text(item.title.wrappedValue)
                                        .lineLimit(1)
                                }
                                
                            }
                            .onDelete { indexSet in
                            // Delete the selected note
                            let todosToDelete = indexSet.map { model.list[$0] }
                            todosToDelete.forEach(model.deleteData)
                                
                            }
                            
                        }

                    }

                    .navigationBarTitle("Notes")
                        
                }
                    .toolbar{
                        ToolbarItem(placement: .navigationBarTrailing) {
                            Button("Add"){
                                showNewScreen.toggle()
                            }
                        }
                    }
                        .sheet(isPresented: $showNewScreen) {
                            NewScreen(model: model, showNewScreen: $showNewScreen, list: $model.list)
                            }
         
            }
    }
   
//     init() set up  view's initial state or can perform any other necessary setup before the view is displayed.
    init() {
            model.getData()
    }
    

}

struct NewScreen: View {
    
    @ObservedObject var model: FirebaseService
    @Binding var showNewScreen: Bool
    @State var title = ""
    @Binding var list: [Note]
    
    var body: some View {
        
        NavigationView {
            VStack(spacing: 30) {
                TextField("Enter text", text: $title)
                    .padding()
                    .background(Color(hue: 0.011, saturation: 0.014, brightness: 0.843).cornerRadius(10))
                    .font(.headline)

                Button(action: {
                    if (!title.isEmpty){
                        showNewScreen.toggle()
                        model.addData(title: title)
                    }
                    
                }) {
                    Text("ADD NOTE")
                }
                .font(.system(size: 20, weight: .medium))
                .accentColor(.white)
                .frame(width: 200, height: 50)
                .background(Color.blue.cornerRadius(10).shadow(radius: 10))
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color.white, lineWidth: 3)
                )
            }
            .padding()
            .navigationTitle("New Note")
        }
    }
}
   

struct Note: Identifiable {
    var id: String
    var title: String
    
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


