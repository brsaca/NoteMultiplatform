//
//  Tag.swift
//  NoteSwiftData
//
//  Created by Brenda Saavedra Cantu on 18/10/23.
//

import SwiftData
import Foundation

@Model
class Tag {
    @Attribute(.unique) var id: String
    var name: String
    @Relationship var notes: [Note]
    @Transient var isChecked = false
    
    init(id: String, name: String, notes: [Note]) {
        self.id = id
        self.name = name
        self.notes = notes
    }
}
