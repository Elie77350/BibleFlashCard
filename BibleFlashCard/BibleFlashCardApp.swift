//
//  BibleFlashCardApp.swift
//  BibleFlashCard
//
//  Created by Elie BINGUE on 13/03/2024.
//

import SwiftUI

@main
struct BibleFlashCardApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
