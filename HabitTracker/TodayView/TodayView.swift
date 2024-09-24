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
                    // Most used habits
                    //displayMostUsed()
                    let todayHabit: [Habit] = todayHabits(habits: habits)
                    HabitListView(list: todayHabit)
                    Spacer()
                    TodayViewButtons()
                    Spacer()
                }
                .navigationTitle("Log your Habits!")
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
