//
//  HabitView.swift
//  HabitTracking
//
//  Created by MacBookPro on 11.02.2022.
//

import SwiftUI

struct HabitView: View {
    @State private var removeAlertShown = false
    @ObservedObject var habits: Habits
    let habit: Habit
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .leading) {
                    Text(habit.description)
                        .font(.title)
                }
            }
            .navigationTitle(habit.name)
            .toolbar {
                Button {
                    removeAlertShown = true
                } label: {
                    Image(systemName: "trash")
                }
            }
        }
        .alert("Remove Habit", isPresented: $removeAlertShown) {
            Button("Cancel", role: .cancel) { }
            Button("Remove", role: .destructive, action: removeHabit)
        } message: {
            Text("Are you sure?")
        }
    }
    
    func removeHabit() {
        if let index = habits.items.firstIndex(of: habit) {
            habits.items.remove(at: index)
        }
    }
}

struct HabitView_Previews: PreviewProvider {
    static var previews: some View {
        HabitView(habits: Habits(), habit: Habit.example)
    }
}
