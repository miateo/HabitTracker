//
//  LoggedHabit.swift
//  HabitTracker
//
//  Created by Alessandro Miatello on 31/01/24.
//

import Foundation
import SwiftData
import SwiftUI

@Model
class LoggedHabit: Identifiable{
    var id: String = UUID().uuidString
    var habitId: String
    var name: String
    var image: String
    var type: Habitype
    var amount = 1
    var dateLogged: Date   // day habit is logged
    var weekday: String // automatically fetched by the day var
    var habit: Habit?
    var isLogged: Bool = false
    
    init(habitType: Habit, dateLogged: Date) {
        self.habitId = habitType.id
        self.name = habitType.name
        self.image = habitType.image
        self.type = habitType.type
        self.dateLogged = dateLogged
        self.weekday = getWeekDay(dateLogged)
        self.isLogged = true
//        print(self.id, "Logged: ", self.isLogged)
    }
}
