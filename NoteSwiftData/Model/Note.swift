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
    var tag: Tag?
    var createdAt: Date
    
    init(id: String, content: String, tag: Tag?, createdAt: Date) {
        self.id = id
        self.content = content
        self.tag = tag
        self.createdAt = createdAt
    }
}
