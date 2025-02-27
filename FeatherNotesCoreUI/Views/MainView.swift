//
//  MainView.swift
//  FeatherNotes
//
//  Created by Matthieu on 24.02.2025.
//

import FeatherNotesCore
import RealmSwift
import SwiftUI

public struct MainView: View {
    @State private var isAddingNote: Bool
    @ObservedResults(Note.self) var notes

    public init(isAddingNote: Bool = false) {
        _isAddingNote = State(initialValue: isAddingNote)
    }

    public var body: some View {
        NavigationView {
            ZStack {
                ScrollView {
                    VStack(spacing: 8) {
                        ForEach(notes) { note in
                            NavigationLink(destination: NoteDetailView(note: note)) {
                                NoteRow(note: note)
                            }
                        }
                    }
                    .padding()
                }
                .navigationTitle("Notes")

                VStack {
                    Spacer()
                    HStack {
                        Spacer()
                        Button(action: {
                            isAddingNote = true
                        }) {
                            Image(systemName: "plus")
                                .font(.title)
                                .frame(width: 60, height: 60)
                                .background(Color.blue)
                                .foregroundColor(.white)
                                .clipShape(Circle())
                                .shadow(radius: 4)
                        }
                        .padding()
                    }
                }
            }
        }
        .sheet(isPresented: $isAddingNote) {
            CreateNoteView(isPresented: $isAddingNote)
        }
    }
}

#Preview {
    MainView()
}
