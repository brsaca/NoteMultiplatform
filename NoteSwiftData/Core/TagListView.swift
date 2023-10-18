//
//  TagListView.swift
//  NoteSwiftData
//
//  Created by Brenda Saavedra Cantu on 18/10/23.
//

import SwiftData
import SwiftUI

struct TagListView: View {
    // MARK: View Properties
    @Environment(\.modelContext) private var context
    @Query(sort: \Tag.name, order: .reverse) var allTags: [Tag]
    @State var tagText: String = String()
    
    var body: some View {
        List {
            Section {
                DisclosureGroup("Create a tag") {
                    TextField("Enter text", text: $tagText, axis: .vertical)
                        .lineLimit(2...4)
                    
                    Button("Save") {
                        createTag()
                    }
                }
            }
            
            Section {
                if allTags.isEmpty {
                    ContentUnavailableView("You don't have any tags yet", systemImage: "tag")
                } else {
                    ForEach(allTags) { tag in
                        VStack(alignment: .leading) {
                            Text(tag.name)
                        }
                    }
                    .onDelete { indexSet in
                        indexSet.forEach{ index in
                            context.delete(allTags[index])
                        }
                        try? context.save()
                    }
                }
            }
        }
    }
}

extension TagListView {
    func createTag() {
        let tag = Tag(name: tagText)
        context.insert(tag)
        try? context.save()
        
        tagText = ""
    }
}

// MARK: - Previews
#Preview {
    TagListView()
}
