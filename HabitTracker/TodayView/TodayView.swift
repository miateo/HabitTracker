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
//    @Query private var loggedHabits: [LoggedHabit]
    
    var body: some View {
        NavigationStack{
            ZStack{
                Color("BGColor").ignoresSafeArea()
                VStack(alignment: .center){
                    Spacer()
                    // Most used habits or specific day habits?
                    let todayHabit = habits.filter { habit in
                        return todayHabits(habits: habits).contains(habit)
                    }
                    List {
                        ForEach(todayHabit){habit in
                            DisplayHabits(passedHabit: habit)
                        }
                    }
                    .preferredColorScheme(.dark)
                    .scrollContentBackground(.hidden)
                    .listRowSpacing(10.0)

                    Spacer()
                    TodayViewButtons()
                }
                .navigationTitle("Log your Habits!")
                .padding(.bottom, 70) //desc: makes button in this view not go under tabbar
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
