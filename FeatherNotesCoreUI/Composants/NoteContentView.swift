//
//  NoteContentView.swift
//  FeatherNotesCoreUI
//
//  Created by Matthieu on 27.02.2025.
//

import FeatherNotesCore
import SwiftUI

struct NoteContentView: View {
    @Binding var note: Note

    var body: some View {
        ScrollView {
            TextEditor(text: $note.content)
                .padding()
                .frame(maxWidth: .infinity, alignment: .leading)
                .background(Color.white)
                .cornerRadius(15)
                .shadow(radius: 3)
        }
    }
}
