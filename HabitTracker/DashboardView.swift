//
//  ContentView.swift
//  HabitTraker
//
//  Created by Alessandro Miatello on 26/05/23.
//

import SwiftUI
import Charts
let calendar = Calendar.current;
struct DashboardView: View {
    @State var progressValue: Float = 0.0
    let markColors: [Color] = [.green,.red]
    var body: some View {
        ZStack {
            Color("BGColor").ignoresSafeArea()
            VStack{
                Text("Dashboard").fontWeight(.bold)
                    .font(.system(size: 20))
                Spacer()
                HStack{
                    Spacer()
                    ZStack{//MARK: -- Compaund stat summary (circle)
                        RoundedRectangle(cornerRadius: 18)
                            .fill(Color("widgetSet"))
                            .frame(width: 175,height: 170)
                            .padding(0)
                        ProgressBarCircle(progress: self.$progressValue)
                            .frame(width: 120,height: 115)
                            .onAppear(){
                                self.progressValue = 0.60
                            }
                    }
                    Spacer()
                    ZStack{//MARK: -- Habit streak stat
                        RoundedRectangle(cornerRadius: 18)
                            .fill(Color("widgetSet"))
                            .frame(width: 175,height: 170)
                        VStack{
                            HStack{// -- Good habit side
                                Spacer()
                                Image(systemName: "arrow.up") // -- dynamic
                                    .imageScale(.large)
                                VStack{
                                    Text("Up") // -- dynamic
                                        .font(.system(size: 15))
                                    
                                    Text("34%") // -- dynamic
                                        .font(.system(size: 14))
                                        .foregroundColor(.green)
                                }
                                VStack{
                                    Text("Good habit")
                                    Text("streak 🔥")
                                }
                                Spacer()
                            }
                            Divider()
                                .frame(width: 140)
                            HStack{// -- Good habit side
                                Spacer()
                                Image(systemName: "arrow.down") // -- dynamic
                                    .imageScale(.large)
                                VStack{
                                    Text("Down") // -- dynamic
                                        .font(.system(size: 15))
                                    Text("12%") // -- dynamic
                                        .font(.system(size: 14))
                                        .foregroundColor(.red)
                                }
                                VStack{
                                    Text("Bad habit")
                                    Text("streak 💪")
                                }
                                Spacer()
                            }
                        }
                        .fontWeight(.bold)
                    }
                    .font(.system(size: 15))
                    Spacer()
                }
                Spacer()
                ZStack{//MARK: -- Week status chart
                    RoundedRectangle(cornerRadius: 18)
                        .fill(Color("widgetSet"))
                        .frame(width: 375, height: 230)
                    VStack{
                        Text("Week status").fontWeight(.bold)
                        HStack{
                            VStack{// -- single day component
                                Chart{
                                    ForEach(habitdata){item in
                                            BarMark(
                                                x: .value("name", item.weekday),
                                                y: .value("amount", item.amount)
                                            )
                                            .foregroundStyle(item.type == .good ? Color.green : Color.red)//change color of chart based on habit type
                                            
                                    
                                    
                                    }
                                }
                                .frame(width: 350,height: 160)
                                
                            }
                        }
                    }
                    
                }
                Spacer()
                ZStack{//MARK: -- Quote
                    RoundedRectangle(cornerRadius: 18)
                        .fill(Color("widgetSet"))
                        .frame(width: 375, height: 180)
                    VStack{
                        Text("Lorem ipsum dolor sit amet consectetur. Quam tristique quis erat et egestas purus proin a enim.") // -- dynamic
                            .frame(width:300, height:80)
                            .multilineTextAlignment(.center)
                            .font(.system(size: 14))
                    }
                    .italic()
                }
                Spacer()
                ZStack{//MARK: -- Month Graph
                    
                }
            }
            .foregroundColor(Color("fontColor"))
            .padding(.top, 0)
            .frame(height: 650)
            
        }
        .padding(.top, -60)
    }
}
struct Habit: Identifiable{
    let id = UUID()
    let weekday: String
    let day: Date
    let amount = 1
    //var type: Habitype
    let type: Habitype
    
}
func getWeekDay(_ data: Date)->String{
    
    let weekdays = ["Domenica", "Lunedì", "Martedì", "Mercoledì", "Giovedì", "Venerdì", "Sabato"]
        
    // Assicurati che il valore sia compreso tra 1 e 7
    let index = (calendar.component(.weekday, from: data) - 1) % 7
    
    return weekdays[index]
}
enum Habitype: String{
    case good, bad
}
let habitdata: [Habit] = [ //TODO: need to fix the way the weekday get extracted & how the day date get recorded->(this happen when you log the habit not here)
    //Day 1
    Habit(weekday: getWeekDay(calendar.date(from: DateComponents(calendar: calendar, year: 2023, month: 05, day: 12))!),day: calendar.date(from: DateComponents(calendar: calendar, year: 2023, month: 05, day: 15))!,type: .good),
    Habit(weekday: "Thursday",day: calendar.date(from: DateComponents(calendar: calendar, year: 2023, month: 05, day: 12))!,type: .bad),
    Habit(weekday: "Thursday",day: calendar.date(from: DateComponents(calendar: calendar, year: 2023, month: 05, day: 12))!,type: .bad),
    //Day 2
    Habit(weekday: "Friday",day: calendar.date(from: DateComponents(calendar: calendar, year: 2023, month: 05, day: 13))!,type: .bad),
    Habit(weekday: "Friday",day: calendar.date(from: DateComponents(calendar: calendar, year: 2023, month: 05, day: 13))!,type: .good),
    //Day 3
    Habit(weekday: "Monday",day: calendar.date(from: DateComponents(calendar: calendar, year: 2023, month: 05, day: 14))!,type: .good),
    Habit(weekday: "Monday",day: calendar.date(from: DateComponents(calendar: calendar, year: 2023, month: 05, day: 14))!,type: .bad),
    //Day 4
    Habit(weekday: "Wendays",day: calendar.date(from: DateComponents(calendar: calendar, year: 2023, month: 05, day: 15))!,type: .bad),
    Habit(weekday: "Wendays",day: calendar.date(from: DateComponents(calendar: calendar, year: 2023, month: 05, day: 15))!,type: .good),
    //Day 5
    Habit(weekday: "Tuesday",day: calendar.date(from: DateComponents(calendar: calendar, year: 2023, month: 05, day: 16))!,type: .bad),
    Habit(weekday: "Tuesday",day: calendar.date(from: DateComponents(calendar: calendar, year: 2023, month: 05, day: 16))!,type: .good),
    //Day 6
    Habit(weekday: "Sunday",day: calendar.date(from: DateComponents(calendar: calendar, year: 2023, month: 05, day: 17))!,type: .bad),
    Habit(weekday: "Sunday",day: calendar.date(from: DateComponents(calendar: calendar, year: 2023, month: 05, day: 17))!,type: .good),
    //Day 7
    Habit(weekday: "Saturday",day: calendar.date(from: DateComponents(calendar: calendar, year: 2023, month: 05, day: 18))!,type: .bad),
    Habit(weekday: "Saturday",day: calendar.date(from: DateComponents(calendar: calendar, year: 2023, month: 05, day: 18))!,type: .good)
]


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
struct CalculateProgressCircle{//MARK: -- calculating full week/month progress
    
}
func calculateHabitStreak(habitdata: [Habit]){//MARK: Calculating week difference
        //controllo rispetto alla settimana precedente la differenza
        //1 - Calcolo il valore di "bad" & "good" della scorsa settimana
        //2 - Confronto quello rispetto alla settimana corrente(fino al giorno corrente)
        //3 - Ritorno la percentuale
    //let bad_habit_old: Int, good_habit_old: Int;
    //let bad_habit_current: Int, good_habit_current: Int;
    
    
    
}
struct DashboardView_Previews: PreviewProvider{
    static var previews: some View{
        DashboardView()
    }
}
