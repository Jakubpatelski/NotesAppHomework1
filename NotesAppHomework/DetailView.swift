//
//  DetailView.swift
//  NotesAppHomework
//
//  Created by Jakub Patelski on 14/02/2023.
//

import SwiftUI
import PhotosUI

struct DetailView: View {
//    @State private var selectedIMage: PhotosPickerItem? = nil
//    @State private var picture: UIImage?//main gui thread
    @Binding var text: String
//    @Binding var item:Item

    var body: some View {
        VStack{
//            HStack{
//                Button("Save"){
//                    print("saving")
//                    item.title = text
//                }
//            }
            TextField("", text: $text)
                .multilineTextAlignment(.center)
                .font(.system(size: 32, weight: .medium))
                
//            Spacer()
        }
        .padding()

            
        }
    }


struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(text: .constant("Test"))
    }
}
