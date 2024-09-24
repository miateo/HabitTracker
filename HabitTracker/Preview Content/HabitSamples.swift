//
//  HabitSamples.swift
//  HabitTracker
//
//  Created by Alessandro Miatello on 02/02/24.
//

import Foundation

extension Habit{
    static var sampleHabits: [Habit]{
        [
            Habit(name: "Run", image: "figure.run", type: Habitype.good, specificDay: [0]),
            Habit(name: "Junk Food", image: "takeoutbag.and.cup.and.straw.fill", type: Habitype.bad, specificDay: [1]),
            Habit(name: "Study", image: "graduationcap.fill", type: Habitype.good, specificDay: [2])
        ]
    }
}
extension LoggedHabit{
    static var sampleLoggedHabits: [LoggedHabit]{
        [
            LoggedHabit(habitType: Habit(name: "Run", image: "figure.run", type: Habitype.good, specificDay: [0]), dateLogged: Date()),
            LoggedHabit(habitType: Habit(name: "Junk Food", image: "takeoutbag.and.cup.and.straw.fill", type: Habitype.bad, specificDay: [1,3]), dateLogged: Date()),
            LoggedHabit(habitType: Habit(name: "Study", image: "graduationcap.fill", type: Habitype.good, specificDay: [2, 0]), dateLogged: Date())
        ]
    }
}
