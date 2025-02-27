//
//  NoteRow.swift
//  FeatherNotes
//
//  Created by Matthieu on 25.02.2025.
//

import FeatherNotesCore
import SwiftUI

import SwiftUI

struct NoteRow: View {
    var note: Note

    var body: some View {
        ZStack {
            if let noteColor = note.color?.toColor {
                noteColor
                    .cornerRadius(30)
                    .blur(radius: 2)
                    .shadow(radius: 5)
            }

            RoundedRectangle(cornerRadius: 30)
                .fill(Color.white)
                .padding(7)
                .shadow(radius: 2)

            VStack(alignment: .leading) {
                Text(note.title)
                    .font(.headline)
                    .padding(.top, 10)
                    .padding(.horizontal, 8)

                Text(note.content)
                    .font(.subheadline)
                    .padding(.horizontal, 8)
                    .padding(.bottom, 8)
            }
            .padding(.vertical, 5)
            .padding(.horizontal)
        }
        .frame(height: 80)
        .padding(.horizontal)
    }
}

#Preview {
    NoteRow(note: Note(title: "Hello", content: "Lorem ipsum", date: Date.now, author: "Matt", lastModifiedBy: "Matt", color: Color.blue))
}
