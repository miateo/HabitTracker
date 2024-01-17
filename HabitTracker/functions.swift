//
//  functions.swift
//  HabitTracker
//
//  Created by Alessandro Miatello on 10/01/24.
//
//Description: This file contain all the differents functions
import Foundation
import SwiftUI
//MARK: Habit Structure
struct Habit: Identifiable{
    //TODO: need to fix so that on log it save the fulla date Y-M-D and auto-assing the weekday
    //let name : String // habit name -> displayed into the app to log the habit  | Not viewable on the charts (exept habit-specific charts)
    let id = UUID() // unique id to identify the log
    //let year: Int  // year when habit is logged
    //let month: Int // month when habit is logged
    let day: Date   // day habit is logged
    let weekday: String // automatically fetched by the day var
    //let weekday = getWeekDay(calendar.date(from: DateComponents(calendar: calendar, year: year, month: month, day: day))!) TODO: make this shit work
    let amount = 1 //TODO: figure out best way to register the "amount" for every habit
    let type: Habitype // -> enum(good,bad)
    enum Habitype: String{
        case good, bad
    }
}

//MARK: Get day data
func getWeekDay(_ data: Date)->String{
    
    let weekdays = ["Domenica", "Lunedì", "Martedì", "Mercoledì", "Giovedì", "Venerdì", "Sabato"]
        
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

