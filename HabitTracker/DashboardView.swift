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
import SwiftData


let calendar = Calendar.current;
struct DashboardView: View {
    @State var progressValue: Float = 0.0
    @Query private var logHabits: [LoggedHabit]
    
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
                                //TODO: replace with function getDayProgress that calculate current day progress
                                self.progressValue = 0.9 //getDayProgress()
                            }
                    }
                    Spacer()
                    ZStack{//MARK: -- Habit streak stat
                        // TODO: fare in modo che le stat siano dinamiche
                        RoundedRectangle(cornerRadius: 18)
                            .fill(Color("widgetSet"))
                            .frame(width: 195,height: 170)
                        VStack{
                            HStack{// -- Good habit side
                                VStack(alignment: .leading){
                                    Text("Good Habits")
                                        .font(.system(size: 20))
                                    HStack{
                                        Image(systemName: "arrow.up.circle.fill") // -- dynamic
                                            .imageScale(.large)
                                        Text("20% from last week").font(.system(size: 14))// -- dynamic
                                    }
                                }
                            }
                            Divider()
                                .frame(width: 140)
                            HStack{// -- Good habit side
                                Spacer()
                                VStack(alignment: .leading){
                                    Text("Bad Habits").font(.system(size: 20))
                                    HStack{
                                        Image(systemName: "arrow.down.circle.fill") // -- dynamic
                                            .imageScale(.large)
                                        Text("12% from last week").font(.system(size: 14)) // -- dynamic
                                    }
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
                                    ForEach(logHabits){item in
                                        BarMark(
                                            x: .value("name", item.weekday),
                                            y: .value("amount", item.amount)
                                        )
                                        .foregroundStyle(item.type == Habitype.good ? Color.green : Color.red)//change color of chart based on habit type
                                    }.clipShape(RoundedRectangle(cornerRadius: 20))
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
#Preview{
    let preview = Preview(Habit.self)
    preview.addExample(Habit.sampleHabits)
    preview.addExample(LoggedHabit.sampleLoggedHabits)
    return DashboardView()
        .modelContainer(preview.container)
}
