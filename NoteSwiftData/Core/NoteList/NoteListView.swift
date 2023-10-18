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
    @Query(sort: \Tag.name, order: .forward) var allTags: [Tag]
    @State var noteText: String = String()
    
    var body: some View {
        List {
            Section {
                DisclosureGroup("Create a note") {
                    TextField("Enter text", text: $noteText, axis: .vertical)
                        .lineLimit(2...4)
                    
                    DisclosureGroup("Tag With") {
                        if allTags.isEmpty {
                            Text("You don't have any tags yet. Please create one from Tags tab")
                                .foregroundStyle(.gray)
                        } else {
                            ForEach(allTags) { tag in
                                HStack {
                                    Text(tag.name)
                                    if tag.isChecked {
                                        Spacer()
                                        Image(systemName: "checkmark.circle")
                                            .symbolRenderingMode(.multicolor)
                                    }
                                }
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .contentShape(Rectangle())
                                .onTapGesture {
                                    tag.isChecked.toggle()
                                }
                            }
                        }
                    }
                    
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
                            if let tags = note.tags,  tags.count > 0 {
                                Text("Tags:" + tags.map{ $0.name }.joined(separator: ","))
                                    .font(.caption)
                            }
                            Text(note.createdAt, style: .time)
                                .font(.caption)
                        }
                    }
                    .onDelete { indexSet in
                        indexSet.forEach{ index in
                            context.delete(allNotes[index])
                        }
                        try? context.save()
                    }
                }
            }
        }
    }
}

extension NoteListView{
    func createNote() {
        var tags:[Tag] = [Tag]()
        allTags.forEach{ tag in
            if tag.isChecked {
                tags.append(tag)
                tag.isChecked = false
            }
        }
        
        let note = Note(content: noteText, tags: tags)
        context.insert(note)
        try? context.save()
        
        noteText = ""
    }
}

// MARK: - Previews
#Preview {
    NoteListView()
}
