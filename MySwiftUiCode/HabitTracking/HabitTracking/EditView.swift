//
//  EditView.swift
//  HabitTracking
//
//  Created by MacBookPro on 11.02.2022.
//

import SwiftUI

struct EditView: View {
    @Environment(\.dismiss) var dismiss
    @ObservedObject var habits: Habits
    @State private var name = ""
    @State private var description = ""
    @State private var trackingCount = 0
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Habit Name", text: $name)
                }
                
                Section {
                    TextEditor(text: $description)
                } header: {
                    Text("Description")
                }
            }
            .navigationTitle("Edit")
            .toolbar {
                Button("Save", action: saveHabit)
            }
        }
    }
    
    func saveHabit() {
        let habit = Habit(name: name, description: description)
        habits.items.append(habit)
        dismiss()
    }
}

struct EditView_Previews: PreviewProvider {
    static var previews: some View {
        EditView(habits: Habits())
    }
}
