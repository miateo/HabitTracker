//
//  HabitTrakerApp.swift
//  HabitTraker
//
//  Created by Alessandro Miatello on 26/05/23.
//

import SwiftUI
import SwiftData
import Foundation

@main
struct HabitTrakerApp: App {
    let container: ModelContainer
    var body: some Scene {
        WindowGroup {
            AllViewConn()
        }
        .modelContainer(container)
    }
    
    init(){
        let schema = Schema([Habit.self, LoggedHabit.self])
        let config = ModelConfiguration("HabitTracker", schema: schema)
        do {
            container = try ModelContainer(for: schema, configurations: config)
        } catch {
            fatalError("Could not configue the container")
        }
        
        print(URL.applicationSupportDirectory.path(percentEncoded: false))
    }
}
#Preview{
    let preview = Preview(Habit.self)
    preview.addExample(Habit.sampleHabits)
    preview.addExample(LoggedHabit.sampleLoggedHabits)
    return AllViewConn()
        .modelContainer(preview.container)
}
