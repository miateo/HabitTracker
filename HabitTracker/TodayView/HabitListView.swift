//
//  HabitListView.swift
//  HabitTracker
//
//  Created by Alessandro Miatello on 06/02/24.
//
import Foundation
import SwiftUI
import SwiftData

struct HabitListView: View {
    var list: [Habit]
    @Environment(\.modelContext) private var context
    @Query private var habits: [Habit]
    init(list: [Habit]){
        list = list
//        list = Habit.sampleHabits
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
                ForEach($list){item in
                    let habit = Habit(name: item.name.wrappedValue, image: item.image.wrappedValue, type: item.type.wrappedValue, specificDay: item.specificDay.wrappedValue)
                    let loggedhabit = LoggedHabit(habitType: habit, dateLogged: Date())
                    DisplayLoggedHabits(passedLoggedHabit: loggedhabit)
                }.onDelete { indeces in
                    for index in indeces{
                        context.delete(habits[index])
                    }
                }
                
            }
            .preferredColorScheme(.dark)
            .scrollContentBackground(.hidden)
            .listRowSpacing(10.0)
        }
        //        Spacer()
    }
}

//#Preview {
//    HabitListView(list: Habit.sampleHabits)
//}
