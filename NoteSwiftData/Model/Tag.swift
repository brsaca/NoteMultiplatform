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
    var id: String?
    var name: String = ""
    
    @Relationship var notes: [Note]?
    @Attribute(.ephemeral) var isChecked = false
    
    init(name: String) {
        self.id = UUID().uuidString
        self.name = name
        self.notes = []
    }
}
