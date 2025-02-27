//
//  NoteDescriptionView.swift
//  FeatherNotesCoreUI
//
//  Created by Matthieu on 27.02.2025.
//

import FeatherNotesCore
import SwiftUI

struct NoteDescriptionView: View {
    var note: Note

    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text(note.title)
                .font(.largeTitle)
                .fontWeight(.bold)

            Text("Author: \(note.author)")
                .font(.subheadline)
                .foregroundColor(.gray)

            Text("Last Modified By: \(note.lastModifiedBy)")
                .font(.subheadline)
                .foregroundColor(.gray)

            Text("Date: \(formattedDate(note.date))")
                .font(.subheadline)
                .foregroundColor(.gray)
        }
        .padding(.horizontal, 24)
        .padding(.vertical)
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(Color.white)
        .cornerRadius(15)
        .shadow(radius: 3)
    }

    private func formattedDate(_ date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .short
        return formatter.string(from: date)
    }
}

#Preview {
    NoteDescriptionView(note: Samples.note)
}
