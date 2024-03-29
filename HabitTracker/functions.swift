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

struct DisplayAllHabits: View{
    var habit: Habit
    @Environment(\.modelContext) private var context
    
    @State private var isChecked = false
    var body: some View{
        HStack{
            Text(habit.name)
                    .foregroundStyle(Color("fontColor"))
                    .fontWeight(.heavy)
                    .font(.system(size: 24))
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.leading, 18)
            Image(systemName: habit.image)
                .foregroundStyle(habit.type == Habitype.good ? Color.green : Color.red)
                    .padding(.trailing, 8)
                    .font(.system(size: 36))
            
            Image(systemName: isChecked ? "checkmark.circle.fill" : "checkmark.circle")
                .padding([.leading, .trailing], 8)
                .font(.system(size: 36))
                .onTapGesture {
                    var loggedHabit: LoggedHabit?
                    isChecked.toggle()
                    if(isChecked){
                        loggedHabit = logHabit(habit: habit)
                    }else if loggedHabit != nil{
                        deleteLogHabit(loggedHabit: loggedHabit!)
                    }
                }
        }
        
    }
    func logHabit(habit: Habit) -> LoggedHabit{
        let habitType = habit
        let loggedHabit = LoggedHabit(habitType: habitType, dateLogged: Date())
        context.insert(loggedHabit)
        return loggedHabit
    }
    func deleteLogHabit(loggedHabit: LoggedHabit){
        //search the current habit
        //de-log the habit
        
    }
    
}
func mostRecentExt(loggedHabits: [LoggedHabit], allHabits: [Habit]) -> [Habit] {
    
    let allEntries: [LoggedHabit] = loggedHabits
    let allHabits: [Habit] = allHabits
    var mostOccurred: [String : Int]  = [:]
    if mostOccurred.isEmpty == false{
        print("mostOccurred is not empty")
        print(mostOccurred.description)
    }else{ print("Mostoccure is empty")}
    for item in allEntries{
        //print(item.habitId, "count = ", mostOccurred[item.habitId])
        if let count = mostOccurred[item.habitId]{
            print("Existing count for ",item.habitId," count: ",count)
            mostOccurred[item.habitId] = count + 1
            print("Updated count for ",item.habitId," count: ",count)
        }else{
            mostOccurred[item.habitId] = 1
            print("Added ", item.habitId)
        }
        //print(item.habitId, "count = ", mostOccurred[item.habitId])
        print("\n")
        
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

struct AllHabits: View{
    @Binding var isShowingAllHabits: Bool
    var allHabits: [Habit]
    @Environment(\.modelContext) private var context
    var body: some View{
        ForEach(allHabits){item in
            DisplayAllHabits(habit: item)
        }
        
    }
}

struct ModifyHabit: View{
    
    @Environment(\.modelContext) private var context
    
    @Binding var isShowingNewHabitForm: Bool
    @State var name = ""
    @State var icon = "circle.fill"
    @State var isPresented = false
    @State var type = 1
    
    var body: some View{
        VStack(alignment: .leading, spacing: 10.0){
            TextField("Insert the name of the habit", text: $name)
                .padding()
                .background(Color("widgetSet").cornerRadius(15))
                
            HStack{
                Picker("", selection: $type){
                    Text("Good")
                        .tag(1)
                    Text("Bad")
                        .tag(0)
                }.frame(width: UIScreen.main.bounds.width * 0.75)
                    .pickerStyle(.palette).foregroundStyle(Color.gray)
            }
            HStack(alignment: .top){
                Button("Select a icon"){
                    isPresented.toggle()
                }.foregroundColor(.black)
                    .padding(.horizontal, 14)
                    .padding(.vertical, 8)
                    .background(Color("secondaryWidget"))
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                Spacer()
                
                Image(systemName: icon)
                    .sheet(isPresented: $isPresented) {
                        SymbolPicker(symbol: $icon)
                            .preferredColorScheme(.dark)
                    }
                    .font(.system(size: 25))
                    .foregroundStyle(Color.white)
                    .padding(.vertical, 8)
            }
            .frame(width: UIScreen.main.bounds.width * 0.75)
        }
        .toolbar{
            ToolbarItem(placement: .confirmationAction){
                Button("Done"){
                    //print("Done Clicked")
                    if(name != ""){
                        self.isShowingNewHabitForm.toggle()
                        //print("toggled")
                        saveHabit(name: name, image: icon, type: type == 1 ? Habitype.good : Habitype.bad)
                        //print("savehabit called")
                    }
                }
            }
            ToolbarItem(placement: .cancellationAction){
                Button("Cancel"){
                    self.isShowingNewHabitForm.toggle()
                }
            }
        }
    }
    func saveHabit(name: String, image: String, type: Habitype){
        //print("Entered saveHabit")
        let habit : Habit
        //print("habit created")
        habit = Habit(name: name, image: image, type: type)
        //print("Habit created uuid: ", habit.id)
        context.insert(habit)
        //print("Habit saved")
    }
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
    LoggedHabit(habitType: Habit(name: "Morning Run",image: "figure.run",type: .good), dateLogged: calendar.date(from: DateComponents(calendar: calendar, year: 2023, month: 05, day: 15))!),
    LoggedHabit(habitType: Habit(name: "No Junk Food",image: "takeoutbag.and.cup.and.straw.fill",type: .bad), dateLogged: calendar.date(from: DateComponents(calendar: calendar, year: 2023, month: 05, day: 12))!),
    LoggedHabit(habitType: Habit(name: "3h+ phone",image: "iphone",type: .bad), dateLogged: calendar.date(from: DateComponents(calendar: calendar, year: 2023, month: 05, day: 12))!),
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
