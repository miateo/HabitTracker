//
//  Habit.swift
//  HabitTracker
//
//  Created by Alessandro Miatello on 30/01/24.
//

import Foundation
import SwiftUI
import SwiftData


//MARK: Habit Structure
@Model
class Habit: Identifiable{
    //TODO: need to fix so that on log it save the fulla date Y-M-D and auto-assing the weekday
    var id: String // unique id to identify the log
    var name: String // habit name -> displayed into the app to log the habit  | Not viewable on the charts (exept habit-specific charts)
    var image: String
    //let weekday = getWeekDay(calendar.date(from: DateComponents(calendar: calendar, year: year, month: month, day: day))!) TODO: make this shit work
    var amount = 1 //TODO: figure out best way to register the "amount" for every habit
    var type: Habitype // -> enum(good,bad)
    
    init(name: String, image: String, type: Habitype) {
        self.id = UUID().uuidString
        self.name = name
        self.image = image
        self.type = type
    }
}

@Model
class LoggedHabit: Identifiable{
    let habitType: Habit
    var dateLogged: Date   // day habit is logged
    var weekday: String // automatically fetched by the day var
    
    init(habitType: Habit, dateLogged: Date, weekday: String) {
        self.habitType = habitType
        self.dateLogged = dateLogged
        self.weekday = weekday
    }
}

enum Habitype: String, Codable{
    case good, bad
}


