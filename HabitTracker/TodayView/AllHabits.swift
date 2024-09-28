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
//        VStack{}.onAppear{
//            DispatchQueue.main.async {
//                print("Start loop")
//                for habit in allHabits {
//                    print("Inside loop: \(habit.name)")
//                }
//                print("End loop")
//            }
//        }
        let _ = print("---starting filter")
        let filteredHabits = allHabits.filter { habit in
            return (!todayHabits(habits: allHabits).contains(habit) &&
                    !checkLogged(habits: allHabits).contains(habit))
        }
//        let checkHabits = checkLogged(habits: allHabits)
        
        let __ = print("---finished filtering")
        VStack{}.onAppear{
            DispatchQueue.main.async {
                print("-Start loop for filtered")
                for habit in filteredHabits {
                    print("Inside loop: \(habit.name)")
                }
                print("-End loop")
            }
        }
        
        HabitListView(list: filteredHabits)
    }
    
}

#Preview{
    AllHabits(filterString: "")
}
