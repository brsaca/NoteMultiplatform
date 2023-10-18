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
    var id: String?
    var content: String = ""
    var createdAt: Date = Date()
    
    @Relationship(inverse: \Tag.notes) var tags: [Tag]?
    
    init(content: String, tags: [Tag]) {
        self.id = UUID().uuidString
        self.content = content
        self.tags = tags
    }
}
