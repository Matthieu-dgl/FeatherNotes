//
//  Note.swift
//  FeatherNotes
//
//  Created by Matthieu on 24.02.2025.
//

import RealmSwift
import SwiftUI

public class Note: Object, ObjectKeyIdentifiable {
    @Persisted(primaryKey: true) public var id: ObjectId
    @Persisted public var title: String
    @Persisted public var content: String
    @Persisted public var date: Date
    @Persisted public var author: String
    @Persisted public var lastModifiedBy: String
    @Persisted public var color: PersistableColor?

    public convenience init(title: String, content: String, date: Date, author: String, lastModifiedBy: String, color: Color) {
        self.init()
        self.title = title
        self.content = content
        self.date = date
        self.author = author
        self.lastModifiedBy = lastModifiedBy
        self.color = PersistableColor(color: color)
    }
}
