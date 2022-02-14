//
//  DataController.swift
//  CoreDataCars
//
//  Created by MacBookPro on 11.02.2022.
//

import Foundation
import CoreData

@MainActor class DataController: ObservableObject {
    let container = NSPersistentContainer(name: "Cars")
    
    init() {
        container.loadPersistentStores { description, error in
            if let error = error {
                print("Core Data failed to load: \(error.localizedDescription)")
                return
            }
            
            self.container.viewContext.mergePolicy = NSMergePolicy.mergeByPropertyObjectTrump
        }
    }
}
