//
//  Persistence.swift
//  Devote-udemy
//
//  Created by Mewan on 19/04/2021.
//

import CoreData

struct PersistenceController {
    
    // MARK: Initialization

    init(inMemory: Bool = false) {
        container = NSPersistentContainer(name: "Devote_udemy")
        if inMemory {
            container.persistentStoreDescriptions.first!.url = URL(fileURLWithPath: "/dev/null")
        }
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
    }
    
    // MARK: Properties

    static let shared = PersistenceController()

    static var preview: PersistenceController = {
        let result = PersistenceController(inMemory: true)
        let viewContext = result.container.viewContext
        for i in 0...5 {
            let newItem = Item(context: viewContext)
            newItem.timestamp = Date()
            newItem.task = "Complete the course, okay?"
            newItem.isCompleted = false
            newItem.id = UUID()
        }
        do {
            try viewContext.save()
        } catch {
            let nsError = error as NSError
            fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
        }
        return result
    }()

    let container: NSPersistentContainer
}
