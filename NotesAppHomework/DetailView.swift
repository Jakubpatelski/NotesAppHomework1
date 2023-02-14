//
//  DetailView.swift
//  NotesAppHomework
//
//  Created by Jakub Patelski on 14/02/2023.
//

import SwiftUI

struct DetailView: View {
    @Binding var text: String

    var body: some View {
        VStack{
            TextField("", text: $text)
                .multilineTextAlignment(.center)
                .font(.system(size: 32, weight: .medium))
                
        }
        .padding()

            
        }
    }


struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(text: .constant("Test"))
    }
}
