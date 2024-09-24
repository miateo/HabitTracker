//
//  functions.swift
//  HabitTracker
//
//  Created by Alessandro Miatello on 10/01/24.
//
//Description: This file contain all the differents functions
import Foundation
import SwiftUI
import SwiftData
import SymbolPicker
import UIKit

//MARK: Get name of the day data
func getWeekDay(_ data: Date)->String{
    
    let weekdays = ["sunday", "monday", "tuesday", "wednesday", "thursday", "friday", "saturday"]
        
    // Assicurati che il valore sia compreso tra 1 e 7
    let index =  (calendar.component(.weekday, from: data) - 1) % 7
    
    return weekdays[index]
}
//MARK: Calculate graphs
func calculateHabitStreak(habitdata: [Habit]){//MARK: Calculating week difference
        //controllo rispetto alla settimana precedente la differenza
        //1 - Calcolo il valore di "bad" & "good" della scorsa settimana
        //2 - Confronto quello rispetto alla settimana corrente(fino al giorno corrente)
        //3 - Ritorno la percentuale
    //let bad_habit_old: Int, good_habit_old: Int;
    //let bad_habit_current: Int, good_habit_current: Int;
}
struct ProgressBarCircle: View{//MARK: Progress circle
    @Binding var progress: Float
    var body: some View{
        ZStack{
            Circle()
                .stroke(lineWidth: 20.0)
                .opacity(0.20)
                .foregroundColor(Color("BGColor"))
            Circle()
                .trim(from: 0.0, to: CGFloat(min(self.progress, 1.0)))
                .stroke(style:StrokeStyle(lineWidth: 12.0, lineCap: .round, lineJoin: .round))
                .foregroundColor(color(self.progress))
                .rotationEffect(Angle(degrees: 270))
            Text(String(Int(self.progress*100))+"%")
                .font(.system(size:25))
                .fontWeight(.semibold)
        }
    }
    func color(_ value: Float) -> Color{
        if value>0{
            return .blue
        }else{
            return .red
        }
    }
}
func getDayProgress(){
    /**
     1 - Fetch current day data -> see what dalily habit are logged
     2 - Calculate the amount --> habitDone/habitNotDone -> express it with a float value
     3 - return the value
     */
    return
    
}

//MARK: Return the 5 most used habit logged
//TODO: need to make it so that checks only last 7 days
func mostRecentExt(loggedHabits: [LoggedHabit], allHabits: [Habit]) -> [Habit] {
    
    let allEntries: [LoggedHabit] = loggedHabits
    let allHabits: [Habit] = allHabits
    var mostOccurred: [String : Int]  = [:]
    if mostOccurred.isEmpty == false{
        //print("mostOccurred is not empty")
        //print(mostOccurred.description)
    }else{
        //print("Mostoccure is empty")
    }
    for item in allEntries{
        //print(item.habitId, "count = ", mostOccurred[item.habitId])
        if let count = mostOccurred[item.habitId]{
            //print("Existing count for ",item.habitId," count: ",count)
            mostOccurred[item.habitId] = count + 1
            //print("Updated count for ",item.habitId," count: ",count)
        }else{
            mostOccurred[item.habitId] = 1
            //print("Added ", item.habitId)
        }
        //print(item.habitId, "count = ", mostOccurred[item.habitId])
    }
    let sortedMostOccurred = mostOccurred.sorted{ $0.value > $1.value}
    var topFiveHabits: [Habit] = []
    for (_, (uuid, _)) in sortedMostOccurred.prefix(5).enumerated() {
        // Cerca l'oggetto Habit corrispondente nel tuo array 'allHabits'
        if let habit = allHabits.first(where: { $0.id == uuid }) {
            //print(index, "uuid= ", uuid, "count = ", count)
            // Aggiungi l'oggetto Habit a 'topFiveHabits'
            topFiveHabits.append(habit)
        }
    }
    return topFiveHabits
}

func todayHabits(habits: [Habit]) -> [Habit]{
    var dayHabit: [Habit] = []
    let weekDay: [String : Int] = [
        "monday" : 1,
        "tuesday" : 2,
        "wednesday" : 3,
        "thursday" : 4,
        "friday" : 5,
        "saturday" : 6,
        "sunday" : 7
    ]
    for habit in habits{
//        print("weekday func result = ", getWeekDay(Date()))
        if habit.specificDay.contains(weekDay[getWeekDay(Date())]!) || habit.specificDay.contains([0]){
            dayHabit.append(habit)
        }
    }
    return dayHabit
}

func checkMostUsedLast(days :Int){
    /**
     days rappresenta il numero di giorni indietro nel quali cercare
     1- fech of lest {days} data
     2 - bubblesort by log count of every habit
     3 - Return an ordered array list of the habits in the last {days} days
     */
    
}
func displayMostUsed(days :Int, amount :Int){
    /**
     days rappresenta il numero di giorni indietro nel quali cercare
     1 - Utilizza checkMostUsedLast(int days) dove days rappresenta il numero di giorni indietro nel quali cercare
     2 - crea una specie di lista che permette di espandere gli habits
     3 - display the most used habits in the last {days} days
     */
}

let habitData: [LoggedHabit] = [ //TODO: need to fix the way the weekday get extracted & how the day date get recorded->(this happen when you log the habit not here)
    //Description: this is a sample to fill the chart

    
    //Day 1
//    LoggedHabit(habitType: Habit(name: "Morning Run",image: "figure.run",type: .good), dateLogged: calendar.date(from: DateComponents(calendar: calendar, year: 2023, month: 05, day: 15))!),
//    LoggedHabit(habitType: Habit(name: "No Junk Food",image: "takeoutbag.and.cup.and.straw.fill",type: .bad), dateLogged: calendar.date(from: DateComponents(calendar: calendar, year: 2023, month: 05, day: 12))!),
//    LoggedHabit(habitType: Habit(name: "3h+ phone",image: "iphone",type: .bad), dateLogged: calendar.date(from: DateComponents(calendar: calendar, year: 2023, month: 05, day: 12))!),
    /*
    //Day 2
    Habit(name: "Test", day: calendar.date(from: DateComponents(calendar: calendar, year: 2023, month: 05, day: 13))!, weekday: "Friday",type: .bad),
    Habit(name: "Test", day: calendar.date(from: DateComponents(calendar: calendar, year: 2023, month: 05, day: 13))!, weekday: "Friday",type: .good),
    //Day 3
    Habit(name: "Test", day: calendar.date(from: DateComponents(calendar: calendar, year: 2023, month: 05, day: 14))!, weekday: "Monday",type: .good),
    Habit(name: "Test", day: calendar.date(from: DateComponents(calendar: calendar, year: 2023, month: 05, day: 14))!, weekday: "Monday",type: .bad),
    //Day 4
    Habit(name: "Test", day: calendar.date(from: DateComponents(calendar: calendar, year: 2023, month: 05, day: 15))!, weekday: "Wendays",type: .bad),
    Habit(name: "Test", day: calendar.date(from: DateComponents(calendar: calendar, year: 2023, month: 05, day: 15))!, weekday: "Wendays",type: .good),
    //Day 5
    Habit(name: "Test", day: calendar.date(from: DateComponents(calendar: calendar, year: 2023, month: 05, day: 16))!, weekday: "Tuesday",type: .bad),
    Habit(name: "Test", day: calendar.date(from: DateComponents(calendar: calendar, year: 2023, month: 05, day: 16))!, weekday: "Tuesday",type: .good),
    //Day 6
    Habit(name: "Test", day: calendar.date(from: DateComponents(calendar: calendar, year: 2023, month: 05, day: 17))!, weekday: "Sunday",type: .bad),
    Habit(name: "Test", day: calendar.date(from: DateComponents(calendar: calendar, year: 2023, month: 05, day: 17))!, weekday: "Sunday",type: .good),
    //Day 7
    Habit(name: "Test", day: calendar.date(from: DateComponents(calendar: calendar, year: 2023, month: 05, day: 18))!, weekday: "Saturday",type: .bad),
    Habit(name: "Test", day: calendar.date(from: DateComponents(calendar: calendar, year: 2023, month: 05, day: 18))!, weekday: "Saturday",type: .good)
 */]
