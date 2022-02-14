//
//  CoreDataCarsApp.swift
//  CoreDataCars
//
//  Created by MacBookPro on 11.02.2022.
//

import SwiftUI

@main
struct CoreDataCarsApp: App {
    @StateObject var controller = DataController()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, controller.container.viewContext)
        }
    }
}
