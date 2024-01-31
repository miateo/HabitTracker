//
//  HabitTrakerApp.swift
//  HabitTraker
//
//  Created by Alessandro Miatello on 26/05/23.
//

import SwiftUI
import SwiftData

@main
struct HabitTrakerApp: App {
    var body: some Scene {
        WindowGroup {
            AllViewConn()
        }.modelContainer(for: [Habit.self, LoggedHabit.self])
    }
}
struct HabitTraker_Previews: PreviewProvider{
    static var previews: some View{
        AllViewConn()
    }
}
