//
//  NoteDetailView.swift
//  FeatherNotes
//
//  Created by Matthieu on 25.02.2025.
//

import FeatherNotesCore
import SwiftUI

struct NoteDetailView: View {
    @State var note: Note
    private var noteRepository = NoteRepository()

    init(note: Note, noteRepository: NoteRepository = NoteRepository()) {
        self.note = note
        self.noteRepository = noteRepository
    }

    var body: some View {
        VStack(spacing: 20) {
            NoteDescriptionView(note: note)

            Divider()

            NoteContentView(note: $note)
        }
        .padding()
        .background(note.color?.toColor ?? Color.white)
        .navigationTitle("Note Details")
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button("Save") {
                    saveNote()
                }
            }
        }
    }

    private func saveNote() {
        noteRepository.updateNote(note)
    }
}

#Preview {
    NoteDetailView(note: Samples.note)
}
