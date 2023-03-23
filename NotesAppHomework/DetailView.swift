//
//  DetailView.swift
//  NotesAppHomework
//
//  Created by Jakub Patelski on 14/02/2023.
//

import SwiftUI
import PhotosUI

struct DetailView: View {
    @Binding var text: String
    @ObservedObject var model = FirebaseService()
    let note: Note // note object that contains the note details
    @State private var isModified = false // Add a flag to track if the data has been modified



    var body: some View {
        VStack{

            TextField("", text: $text, axis: .vertical)
                .multilineTextAlignment(.center)
                .font(.system(size: 32, weight: .medium))
                .onChange(of: text) { _ in
                      isModified = true // Set the flag to true when the text is changed
                   }
 
                
        }
        .padding()

        .onDisappear {

            if isModified {
                model.updateData(noteToUpdate: note)
                isModified = false // Reset the flag
            }
         }
        
        }
    
    private func onTextChanged() {
         isModified = true
     }
    
}

