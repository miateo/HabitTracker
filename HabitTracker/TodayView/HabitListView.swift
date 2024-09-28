//
//  HabitListView.swift
//  HabitTracker
//
//  Created by Alessandro Miatello on 06/02/24.
//
import Foundation
import SwiftUI
import SwiftData
// This class is responsable to show all the habits that are present in the memory
// is the extendable panel at the bottom
struct HabitListView: View {
    @State var list: [Habit]
    @Environment(\.modelContext) private var context
    @Query private var habits: [Habit]
//    @Query private var allLoggedHabits: [LoggedHabit]
    init(list: [Habit]){
        self.list = list
    }
    var body: some View {
        //        Spacer()
        if list.isEmpty {
            Text("Create your first Habit")
                .foregroundStyle(Color("fontColor"))
                .font(.system(size:24))
                .fontWeight(.bold)
                .frame(alignment: .center)
        }else{
            List{
                /*
                ForEach($list){item in
                    let habit = Habit(name: item.name.wrappedValue, image: item.image.wrappedValue, type: item.type.wrappedValue, specificDay: item.specificDay.wrappedValue)
                    let loggedhabit = LoggedHabit(habitType: habit, dateLogged: Date())
                    DisplayLoggedHabits(passedLoggedHabit: loggedhabit)
//                    DisplayHabits(passedHabit: habit) TODO: Need to add checkmark & log possibilities
                    let _ = print("ricarico gli habit")
                }
                .onDelete { indeces in
                    for index in indeces{
                        
                        // Debugging
                            print("Habits list before deletion:")
                            
                            // Print the entire list of habits before deletion
                            for habit in habits {
                                print("Habit name: \(habit.name) index: \(index)")
                            }
                        // ---
                        
                        print("Deleting \(habits[index].name) index: \(index)")
                        context.delete(habits[index])
                        
                        try? context.save()
                        
                            // Debugging
                                print("Habits list after deletion:")
                                
                                // Print the entire list of habits before deletion
                                for habit in habits {
                                    print("Habit name: \(habit.name)")
                                }
                            // ---
                        
                    }
                }*/
                ForEach(Array($list.enumerated()), id: \.element.id){(index, item) in
//                    let _ = print("habit: \(item.name.wrappedValue) index: \(index)")
                    let habit = Habit(name: item.name.wrappedValue, image: item.image.wrappedValue, type: item.type.wrappedValue, specificDay: item.specificDay.wrappedValue)
                    DisplayHabits(passedHabit: habit)
                    
                }.onDelete{indeces in
                    for index in indeces{
                        context.delete(habits[index])
                    }
                }
                
            }
            .preferredColorScheme(.dark)
            .scrollContentBackground(.hidden)
            .listRowSpacing(10.0)
        }
    }
}

#Preview {
    HabitListView(list: Habit.sampleHabits)
}
