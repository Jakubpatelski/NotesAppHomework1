//
//  ContentView.swift
//  NotesAppHomework
//
//  Created by Jakub Patelski on 14/02/2023.
//

import SwiftUI

struct ContentView: View {
    
    @State private var myList = [
    Item(title: "First Note"),
    Item(title: "Second Note")
    ]
    @State private var newText: String = ""
    var body: some View {
        VStack {
            NavigationView {

//                List($myList){ item in
//                    NavigationLink(destination: DetailView(text: item.title)) {
//                        Text(item.title.wrappedValue)
//
//                    }
//                }
                List {
                    ForEach($myList) { item in
                        NavigationLink(destination: DetailView(text: item.title)) {
                            Text(item.title.wrappedValue)
                        }
                    }
                    .onDelete { indexSet in
                        myList.remove(atOffsets: indexSet)
                    }
                }
                
                .navigationBarTitle("Notes")
            }

            VStack(spacing: 20){
                TextField("Enter text", text: $newText)
                .padding()
                .background(Color.gray.opacity(0.3).cornerRadius(10))
                .foregroundColor(.black)
                .font(.headline)
                
                Button {
                    
                    if(!newText.isEmpty){
                        myList.append(Item(title: newText))
                        newText=""
                        print(myList)
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


