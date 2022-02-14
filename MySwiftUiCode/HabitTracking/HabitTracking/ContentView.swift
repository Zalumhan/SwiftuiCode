//
//  ContentView.swift
//  HabitTracking
//
//  Created by MacBookPro on 11.02.2022.
//

import SwiftUI
import UserNotifications

struct ContentView: View {
    @StateObject var habits = Habits()
    @State private var showEditView = false
    
    var body: some View {
        NavigationView {
            List {
                ForEach(habits.items) { habit in
                    NavigationLink {
                        HabitView(habits: habits, habit: habit)
                    } label: {
                        Text(habit.name)
                            .contextMenu {
                                Button {
                                    addNotification(for: habit)
                                } label: {
                                    Label("Remind Me", systemImage: "bell")
                                }
                                .tint(.orange)
                            }
                    }
                }
                .onDelete(perform: removeHabit)
            }
            .navigationTitle("Habits Tracking")
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    EditButton()
                }
                
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        showEditView = true
                    } label: {
                        Image(systemName: "plus")
                    }
                }
            }
        }
        .sheet(isPresented: $showEditView) {
            EditView(habits: habits)
        }
    }
    
    func removeHabit(at offset: IndexSet) {
        habits.items.remove(atOffsets: offset)
    }
    
    func addNotification(for habit: Habit) {
        let center = UNUserNotificationCenter.current()

        let addRequest = {
            let content = UNMutableNotificationContent()
            content.title = "Start to: \(habit.name)"
            content.sound = UNNotificationSound.default

            var dateComponents = DateComponents()
            dateComponents.hour = 9
//            let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: false)
            let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)

            let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
            center.add(request)
        }

        center.getNotificationSettings { settings in
            if settings.authorizationStatus == .authorized {
                addRequest()
            } else {
                center.requestAuthorization(options: [.alert, .badge, .sound]) { success, error in
                    if success {
                        addRequest()
                    } else {
                        print("D'oh")
                    }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
