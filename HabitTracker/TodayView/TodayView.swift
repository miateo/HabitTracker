//
//  TodayView.swift
//  HabitTraker
//
//  Created by Alessandro Miatello on 09/06/23.
//
/* This view is made to be able to log the differents type of habits made by the user
 it records:
 - What habit have been logged & how many times
 - If 
 */
import Foundation
import SwiftUI
import SwiftData
import UIKit

struct TodayView: View {
    @Environment(\.modelContext) private var context
    @Query private var habits: [Habit]
    @Query private var loggedHabits: [LoggedHabit]
    
    var body: some View {
        NavigationStack{
            ZStack{
                Color("BGColor").ignoresSafeArea()
                VStack(alignment: .center){
                    Spacer()
                    // Most used habits or specific day habits?
                    let todayHabit: [Habit] = todayHabits(habits: habits) //  Add to the array habits set for that day
                    List {
                        ForEach(todayHabit){habit in
                            DisplayHabits(passedHabit: habit)
                        }
//                        Text("Ristampo gli habits")
                    }
                    .preferredColorScheme(.dark)
                    .scrollContentBackground(.hidden)
                    .listRowSpacing(10.0)
//                    HabitListView(list: todayHabit)
//                        .background(.white)
//                    Text("listview stampato")

                    Spacer()
                    TodayViewButtons()
                }
                .navigationTitle("Log your Habits!")
                .padding(.bottom, 70) // makes button in this view not go under tabbar
            }
        }
    }
}

#Preview{
    let preview = Preview(Habit.self)
    preview.addExample(Habit.sampleHabits)
    preview.addExample(LoggedHabit.sampleLoggedHabits)
    return TodayView()
        .modelContainer(preview.container)
}
