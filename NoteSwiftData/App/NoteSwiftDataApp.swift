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
            ContentView()
                .modelContainer(for: [
                    Tag.self,
                    Note.self
                ])
        }
    }
}
