//
//  DataSource.swift
//  HabitTracking
//
//  Created by MacBookPro on 11.02.2022.
//

import Foundation

struct Habit: Codable, Identifiable, Equatable {
    var id = UUID()
    let name: String
    let description: String
    
    static let example = Habit(name: "Example Name", description: "Description Example")
}

@MainActor class Habits: ObservableObject {
    @Published var items = [Habit]() {
        didSet {
            if let encodedHabits = try? JSONEncoder().encode(items) {
                UserDefaults.standard.set(encodedHabits, forKey: "SavedHabits")
            }
        }
    }
    
    init() {
        if let savedHabits = UserDefaults.standard.data(forKey: "SavedHabits") {
            if let decodedHabits = try? JSONDecoder().decode([Habit].self, from: savedHabits) {
                items = decodedHabits
                return
            }
        }
        
        items = []
    }
}
