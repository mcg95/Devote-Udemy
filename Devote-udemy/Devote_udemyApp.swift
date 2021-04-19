//
//  Devote_udemyApp.swift
//  Devote-udemy
//
//  Created by Mewan - SnappyMob on 19/04/2021.
//

import SwiftUI

@main
struct Devote_udemyApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
