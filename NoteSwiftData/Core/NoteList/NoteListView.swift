//
//  NoteListView.swift
//  NoteSwiftData
//
//  Created by Brenda Saavedra Cantu on 18/10/23.
//

import SwiftData
import SwiftUI

struct NoteListView: View {
    // MARK: View Properties
    @Environment(\.modelContext) private var context
    @Query(sort: \Note.createdAt, order: .reverse) var allNotes: [Note]
    @State var noteText: String = String()
    
    var body: some View {
        List {
            Section {
                DisclosureGroup("Create a note") {
                    TextField("Enter text", text: $noteText, axis: .vertical)
                        .lineLimit(2...4)
                    
                    Button("Save") {
                        createNote()
                    }
                }
            }
            
            Section {
                if allNotes.isEmpty {
                    ContentUnavailableView("You don't have any notes yet", systemImage: "note")
                } else {
                    ForEach(allNotes) { note in
                        VStack(alignment: .leading) {
                            Text(note.content)
                            Text(note.createdAt, style: .time)
                                .font(.caption)
                        }
                    }
                }
            }
        }
    }
    
    func createNote() {
        let note = Note(id: UUID().uuidString, content: noteText, tag: nil, createdAt: .now)
        context.insert(note)
        try? context.save()
    }
}

// MARK: - Previews
#Preview {
    NoteListView()
}
