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
    let name : String // habit name -> displayed into the app to log the habit  | Not viewable on the charts (exept habit-specific charts)
    let id = UUID() // unique id to identify the log
    //let year: Int  // year when habit is logged
    //let month: Int // month when habit is logged
    let day: Date   // day habit is logged
    let weekday: String // automatically fetched by the day var
    let image: Image
    //let weekday = getWeekDay(calendar.date(from: DateComponents(calendar: calendar, year: year, month: month, day: day))!) TODO: make this shit work
    let amount = 1 //TODO: figure out best way to register the "amount" for every habit
    let type: Habitype // -> enum(good,bad)
    enum Habitype: String{
        case good, bad
    }
    init(name: String,day: Date, weekday: String, image: Image, type: Habitype) {
        self.name = name
        self.image = image
        self.type = type
        self.day = day
        self.weekday = weekday
    }
    
    init(name: String, image: Image, type: Habitype) {
        self.name = name
        self.image = image
        self.type = type
        self.day = Date()
        self.weekday = ""
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
struct DisplayHabit: View{
    var habit: Habit
    @State private var isChecked = false
    var body: some View{
        HStack{
            Text(habit.name)
                .foregroundStyle(Color("fontColor"))
                .fontWeight(.heavy)
                .font(.system(size: 24))
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.leading, 18)
            habit.image
                .foregroundStyle(habit.type == .good ? Color.green : Color.red)
                .padding(.trailing, 8)
                .font(.system(size: 36))
            Image(systemName: isChecked ? "checkmark.circle.fill" : "checkmark.circle")
                .padding([.leading, .trailing], 8)
                .font(.system(size: 36))
                .onTapGesture {
                    isChecked.toggle()
                }
            
        }.frame(width: UIScreen.main.bounds.width * 0.95, height: 60)
            .background(Color("widgetSet"))
            .clipShape(RoundedRectangle(cornerRadius: 20))
            
    }
}

struct NewHabit: View{
    
    @State var name = ""
    @State var image = Image(systemName: "")
    @State var type = 0
    var body: some View{
        VStack{
            TextField("Insert the name of the habit", text: $name)
                .textFieldStyle(.roundedBorder)
                .background(.gray)
                .frame(width: UIScreen.main.bounds.width * 0.75)
            HStack{
                Button{
                    type = 1
                }label: {
                    Text("good")
                }
                .frame(width: UIScreen.main.bounds.width * 0.30, height: 40)
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                    .background(.green)
                    .font(.system(size: 18))
                    .fontWeight(.bold)
                Button("Bad"){
                    type = 0
                }
                .textFieldStyle(.roundedBorder)
                .background(.red)
                .padding(20)
                .frame(width: UIScreen.main.bounds.width * 0.45)
            }.frame(width: UIScreen.main.bounds.width * 0.65)
            Text("Select habit Icon")
        }
    }
    func createNewHabit(){
        let habit = Habit(name: name, image: image, type: type == 1 ? Habit.Habitype.good : Habit.Habitype.bad)
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

let habitdata: [Habit] = [ //TODO: need to fix the way the weekday get extracted & how the day date get recorded->(this happen when you log the habit not here)
    //Description: this is a sample to fill the chart
    //Day 1
    Habit(name: "Morning Run", day: calendar.date(from: DateComponents(calendar: calendar, year: 2023, month: 05, day: 15))!, weekday: getWeekDay(calendar.date(from: DateComponents(calendar: calendar, year: 2023, month: 05, day: 12))!),image: Image(systemName: "figure.run"),type: .good),
    Habit(name: "No Junk Food", day: calendar.date(from: DateComponents(calendar: calendar, year: 2023, month: 05, day: 12))!, weekday: getWeekDay(calendar.date(from: DateComponents(calendar: calendar, year: 2023, month: 05, day: 12))!),image: Image(systemName: "takeoutbag.and.cup.and.straw.fill"),type: .bad),
    Habit(name: "3h+ phone", day: calendar.date(from: DateComponents(calendar: calendar, year: 2023, month: 05, day: 12))!, weekday: getWeekDay(calendar.date(from: DateComponents(calendar: calendar, year: 2023, month: 05, day: 12))!),image: Image(systemName: "iphone"),type: .bad),
    //Day 2
    /*Habit(name: "Test", day: calendar.date(from: DateComponents(calendar: calendar, year: 2023, month: 05, day: 13))!, weekday: "Friday",type: .bad),
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
