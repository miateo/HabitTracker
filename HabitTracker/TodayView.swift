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
import SwiftUI

struct TodayView: View {
    var body: some View {
        ZStack{
            Color("BGColor")
                .ignoresSafeArea()
            VStack{
                // WeekView
                Text("Log your Habits!")
                    .foregroundStyle(Color("fontColor"))
                    .font(.system(size:24))
                    .fontWeight(.bold)
                // Most used habits
                //displayMostUsed()
                DisplayHabit(habit: habitdata[0])
                DisplayHabit(habit: habitdata[1])
                DisplayHabit(habit: habitdata[2])
                HStack{
                    //button to create new habit
                    
                    //button to view all habits
                }
            }
        }
    }
}
struct TodayView_Previews: PreviewProvider{
    static var previews: some View{
        TodayView()
    }
}
