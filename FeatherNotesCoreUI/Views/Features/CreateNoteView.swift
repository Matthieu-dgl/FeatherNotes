//
//  CreateNoteView.swift
//  FeatherNotes
//
//  Created by Matthieu on 25.02.2025.
//

import FeatherNotesCore
import RealmSwift
import SwiftUI

struct CreateNoteView: View {
    @Binding var isPresented: Bool
    @State private var title = ""
    @State private var content = ""
    @State private var author = ""
    @State private var selectedColor: Color = .blue
    let noteRepo = NoteRepository()

    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Title")) {
                    TextField("Enter title", text: $title)
                }

                Section(header: Text("Content")) {
                    TextEditor(text: $content)
                        .frame(height: 150)
                }

                Section(header: Text("Author")) {
                    TextField("Enter author", text: $author)
                }

                Section(header: Text("Color")) {
                    ColorPicker("Pick a color", selection: $selectedColor)
                }
            }
            .navigationTitle("New Note")
            .navigationBarItems(
                leading: Button("Cancel") {
                    isPresented = false
                },
                trailing: Button("Save") {
                    let newNote = Note(
                        title: title,
                        content: content,
                        date: Date(),
                        author: author,
                        lastModifiedBy: author,
                        color: selectedColor
                    )
                    noteRepo.addNote(newNote)
                    isPresented = false
                }
            )
        }
    }
}
