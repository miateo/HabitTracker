//
//  ContentView.swift
//  HabitTraker
//
//  Created by Alessandro Miatello on 26/05/23.
//
/* This view is has as purpose to show the summary of the progress with charts for:
    - Day
    - Week
    - Month
    it doesn't record any data anb has functions only to calculate the charts
*/
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
                                //TODO: replace with function that calculate current day progress
                                self.progressValue = 0.9
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
                            HStack{// -- single day component
                                
                                Chart{
                                    ForEach(habitdata){item in
                                            BarMark(
                                                    x: .value("name", item.weekday),
                                                    y: .value("amount", item.amount)
                                            )
                                            .foregroundStyle(item.type == .good ? Color.green : Color.red)//change color of chart based on habit type
                                    }
                                }.frame(width: 350,height: 160)
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

let habitdata: [Habit] = [ //TODO: need to fix the way the weekday get extracted & how the day date get recorded->(this happen when you log the habit not here)
    //Day 1
    Habit(day: calendar.date(from: DateComponents(calendar: calendar, year: 2023, month: 05, day: 15))!, weekday: getWeekDay(calendar.date(from: DateComponents(calendar: calendar, year: 2023, month: 05, day: 12))!),type: .good),
    Habit(day: calendar.date(from: DateComponents(calendar: calendar, year: 2023, month: 05, day: 12))!, weekday: getWeekDay(calendar.date(from: DateComponents(calendar: calendar, year: 2023, month: 05, day: 12))!),type: .bad),
    Habit(day: calendar.date(from: DateComponents(calendar: calendar, year: 2023, month: 05, day: 12))!, weekday: getWeekDay(calendar.date(from: DateComponents(calendar: calendar, year: 2023, month: 05, day: 12))!),type: .bad),
    //Day 2
    Habit(day: calendar.date(from: DateComponents(calendar: calendar, year: 2023, month: 05, day: 13))!, weekday: "Friday",type: .bad),
    Habit(day: calendar.date(from: DateComponents(calendar: calendar, year: 2023, month: 05, day: 13))!, weekday: "Friday",type: .good),
    //Day 3
    Habit(day: calendar.date(from: DateComponents(calendar: calendar, year: 2023, month: 05, day: 14))!, weekday: "Monday",type: .good),
    Habit(day: calendar.date(from: DateComponents(calendar: calendar, year: 2023, month: 05, day: 14))!, weekday: "Monday",type: .bad),
    //Day 4
    Habit(day: calendar.date(from: DateComponents(calendar: calendar, year: 2023, month: 05, day: 15))!, weekday: "Wendays",type: .bad),
    Habit(day: calendar.date(from: DateComponents(calendar: calendar, year: 2023, month: 05, day: 15))!, weekday: "Wendays",type: .good),
    //Day 5
    Habit(day: calendar.date(from: DateComponents(calendar: calendar, year: 2023, month: 05, day: 16))!, weekday: "Tuesday",type: .bad),
    Habit(day: calendar.date(from: DateComponents(calendar: calendar, year: 2023, month: 05, day: 16))!, weekday: "Tuesday",type: .good),
    //Day 6
    Habit(day: calendar.date(from: DateComponents(calendar: calendar, year: 2023, month: 05, day: 17))!, weekday: "Sunday",type: .bad),
    Habit(day: calendar.date(from: DateComponents(calendar: calendar, year: 2023, month: 05, day: 17))!, weekday: "Sunday",type: .good),
    //Day 7
    Habit(day: calendar.date(from: DateComponents(calendar: calendar, year: 2023, month: 05, day: 18))!, weekday: "Saturday",type: .bad),
    Habit(day: calendar.date(from: DateComponents(calendar: calendar, year: 2023, month: 05, day: 18))!, weekday: "Saturday",type: .good)
]
struct CalculateProgressCircle{//MARK: -- calculating full week/month progress
    
}

struct DashboardView_Previews: PreviewProvider{
    static var previews: some View{
        DashboardView()
    }
}
