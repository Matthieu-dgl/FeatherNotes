//
//  NoteRepository.swift
//  FeatherNotes
//
//  Created by Matthieu on 24.02.2025.
//

import FeatherNotesCore
import RealmSwift
import SwiftUI

public class NoteRepository {
    private let realm: Realm

    public init() {
        do {
            realm = try Realm()
        } catch {
            fatalError("Failed to initialize Realm: \(error)")
        }
    }

    // MARK: - Add a note

    public func addNote(_ note: FeatherNotesCore.Note) {
        do {
            try realm.write {
                realm.add(note)
            }
        } catch {
            print("Error adding note: \(error)")
        }
    }

    // MARK: - Update a note

    public func updateNote(_ note: Note) {
        guard let existingNote = realm.object(ofType: Note.self, forPrimaryKey: note.id) else {
            print("Note not found")
            return
        }

        do {
            try realm.write {
                existingNote.title = note.title
                existingNote.content = note.content
                existingNote.lastModifiedBy = note.lastModifiedBy
                existingNote.color = note.color
                existingNote.date = Date()
            }
        } catch {
            print("Error updating note: \(error)")
        }
    }

    // MARK: - Delete a note

    public func deleteNote(_ note: Note) {
        guard let existingNote = realm.object(ofType: Note.self, forPrimaryKey: note.id) else {
            print("Note not found")
            return
        }

        do {
            try realm.write {
                realm.delete(existingNote)
            }
        } catch {
            print("Error deleting note: \(error)")
        }
    }

    // MARK: - Get all notes

    public func getAllNotes() -> Results<Note> {
        return realm.objects(Note.self).sorted(byKeyPath: "date", ascending: false)
    }

    // MARK: - Get note by ID

    public func getNoteById(_ id: String) -> Note? {
        return realm.object(ofType: Note.self, forPrimaryKey: id)
    }
}
