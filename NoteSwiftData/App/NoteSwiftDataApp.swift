//
//  NoteSwiftDataApp.swift
//  NoteSwiftData
//
//  Created by Brenda Saavedra Cantu on 18/10/23.
//

import SwiftData
import SwiftUI

@main
struct NoteSwiftDataApp: App {
    var body: some Scene {
        WindowGroup {
            TabView{
                noteList
                tagList
            }
                .modelContainer(for: [
                    Tag.self,
                    Note.self
                ])
        }
    }
    
    var noteList: some View {
        NavigationStack {
            NoteListView()
                .navigationTitle("Notes")
        }
        .tabItem { Label("Notes", systemImage: "note") }
    }
    
    var tagList: some View {
        NavigationStack {
            TagListView()
                .navigationTitle("Tags")
        }
        .tabItem { Label("Tags", systemImage: "tag") }
    }
}
