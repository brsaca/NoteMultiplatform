//
//  Note.swift
//  NoteSwiftData
//
//  Created by Brenda Saavedra Cantu on 18/10/23.
//

import SwiftData
import Foundation

@Model
class Note {
    @Attribute(.unique) var id: String
    var content: String
    var createdAt: Date
    
    @Relationship(inverse: \Tag.notes) var tags: [Tag]
    
    init(id: String, content: String, tags: [Tag], createdAt: Date) {
        self.id = id
        self.content = content
        self.tags = tags
        self.createdAt = createdAt
    }
}
