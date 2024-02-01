//
//  Habit.swift
//  HabitTracker
//
//  Created by Alessandro Miatello on 30/01/24.
//

import Foundation
import SwiftUI
import SwiftData

enum Habitype: String, Codable{
    case good, bad
}
//MARK: Habit Structure
@Model
class Habit: Identifiable{
    var id: String = UUID().uuidString // unique id to identify the log
    var name: String // habit name -> displayed into the app to log the habit  | Not viewable on the charts (exept habit-specific charts)
    var image: String
    var amount = 1 //TODO: figure out best way to register the "amount" for every habit
    var type: Habitype // -> enum(good,bad)
    
    
    init(name: String, image: String, type: Habitype) {
        //print("Entered init")
        //self.id = UUID().uuidString
        self.name = name
        self.image = image
        self.type = type
        //print(self.id, self.name, self.image, self.type)
    }
}
