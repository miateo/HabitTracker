//
//  DisplayAllHabits.swift
//  HabitTracker
//
//  Created by Alessandro Miatello on 02/02/24.
//

import SwiftData
import SwiftUI


//MARK: display all the habits
//TODO: make so that it doesn't display the one in the TodayView
struct AllHabits: View{
    
    @Environment(\.modelContext) private var context
    @Query private var allHabits: [Habit]
    
    var habitToShow : [Habit] = []
    init(filterString: String){
        let predicate = #Predicate<Habit>{ habit in
            habit.name.localizedStandardContains(filterString) || filterString.isEmpty
        }
        _allHabits = Query(filter: predicate)
    }
    var body: some View{
//        let _ = print("changes in the allHabit array")
        HabitListView(list: allHabits.filter {
            !todayHabits(habits: allHabits).contains($0)
            &&
            !checkLogged(habits: allHabits).contains($0)
            } )
            .listRowSpacing(10.0)
    }
}
