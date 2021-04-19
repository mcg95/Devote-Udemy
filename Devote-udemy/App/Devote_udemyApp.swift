//
//  Devote_udemyApp.swift
//  Devote-udemy
//
//  Created by Mewan on 19/04/2021.
//

import SwiftUI

@main
struct Devote_udemyApp: App {
    let persistenceController = PersistenceController.shared
    
    @AppStorage("isDarkMode") var isDarkMode = false

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
                .preferredColorScheme(isDarkMode ? .dark : .light)
        }
    }
}
