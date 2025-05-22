//
//  KutubxonaApp.swift
//  Kutubxona
//
//  Created by Muhammad Tohirov on 22/05/25.
//

import SwiftUI

@main
struct KutubxonaApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
