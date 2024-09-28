//
//  AllHabitView.swift
//  HabitTracker
//
//  Created by Alessandro Miatello on 02/02/24.
//
//Renderizza l'elemento Habit

import Foundation
import SwiftUI
import SwiftData

struct DisplayLoggedHabits: View{
    var loggedHabit: LoggedHabit
    @Query private var allLoggedHabits: [LoggedHabit]
    @Environment(\.modelContext) private var context
    //@State private var isChecked: Bool = false
    init(passedLoggedHabit: LoggedHabit){
        loggedHabit = passedLoggedHabit
//        isChecked = loggedHabit.isLogged ? true : false
    }
    var body: some View{
        HStack{
            Text(loggedHabit.name)
                .foregroundStyle(Color("fontColor"))
                .fontWeight(.heavy)
                .font(.system(size: 20))
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.leading, 16)
            Image(systemName: loggedHabit.image)
                .foregroundStyle(loggedHabit.type == Habitype.good ? Color.green : Color.red)
                .padding(.trailing, 8)
                .font(.system(size: 30))
            
            
            Image(systemName: loggedHabit.isLogged ? "checkmark.circle.fill" : "checkmark.circle")
                .padding([.leading, .trailing], 8)
                .font(.system(size: 28))
                .onTapGesture {
                    loggedHabit.isLogged.toggle()
                    print("toggled -> ", loggedHabit.isLogged)
                    if(loggedHabit.isLogged){
                        //loggedHabit = logHabit(habit: habit)
                        print("Habit created: ",loggedHabit.name)
                        context.insert(loggedHabit)
                        print("Habit saved: ",loggedHabit.name)
                    }else{
                        //deleteLogHabit(loggedHabit: loggedHabit!, allLogged: allLoggedHabits)
                        print("Habit unsaved: ",loggedHabit.name)
                        //print("Checkmark false")
                        context.delete(loggedHabit)
                    }
                }
        }
    }
    
}
struct DisplayHabits: View{
    var habit: Habit
    @Query private var allHabits: [Habit]
    @Environment(\.modelContext) private var context
    init(passedHabit: Habit){
        habit = passedHabit
    }
    var body: some View{
        HStack{
            Text(habit.name)
                .foregroundStyle(Color("fontColor"))
                .fontWeight(.heavy)
                .font(.system(size: 20))
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.leading, 16)
            Image(systemName: habit.image)
                .foregroundStyle(habit.type == Habitype.good ? Color.green : Color.red)
                .padding(.trailing, 8)
                .font(.system(size: 30))
            
//        TODO: Il checkmark deve cambiare se l'habit è stato loggato e deve essere displayato sulla vita TodayView
//            let _ = print("checkLog for \(habit.name) return = \(checkLogged(habits: allHabits, habit: habit))")
            Image(systemName: checkLogged(habits: allHabits, habit: habit) ? "checkmark.circle.fill" : "checkmark.circle")
                .padding([.leading, .trailing], 8)
                .font(.system(size: 28))
                .onTapGesture {
//                    let _ = print("clicked")
                    if(checkLog(habit: habit)){
                        print("Deleteing Log for \(habit.name)")
                        deLogHabit(habit: habit)
                    }else{
                        print("Logging \(habit.name)")
                        logHabit(habit: habit)
                    }
                }
        }
    }
    func deLogHabit(habit: Habit){
        // scorre l'array habit.loggedhabits e trova l'istanza corrispondente al giorno attuale e la rimuove
        //TODO: Fixare crash causato dalla rimozione e verificare persistenza dati
        habit.loggedHabit.removeAll{ logged in
            logged.dateLogged == getCurrentDateWithoutTime()
        }
    }
    func logHabit(habit: Habit){
        let newLoggedHabit = LoggedHabit(habitType: habit,dateLogged: getCurrentDateWithoutTime())
//        let _ = print("date-loggedHabit = \(loggedHabit.dateLogged)")
//        context.insert(loggedHabit)
        habit.loggedHabit.append(newLoggedHabit)
        
    }
}

