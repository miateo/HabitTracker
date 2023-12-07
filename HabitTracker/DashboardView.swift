//
//  ContentView.swift
//  HabitTraker
//
//  Created by Alessandro Miatello on 26/05/23.
//

import SwiftUI
import Charts

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
                    ZStack{//MARK: -- Compaund stat summary
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
                ZStack{//MARK: -- Week status
                    RoundedRectangle(cornerRadius: 18)
                        .fill(Color("widgetSet"))
                        .frame(width: 375, height: 230)
                    VStack{
                        Text("Week status").fontWeight(.bold)
                        HStack{
                            VStack{// -- single day component
                                Chart(habitdata){item in
                                    BarMark(
                                        x: .value("name", item.weekday),
                                        y: .value("amount", item.amount)
                                    )
                                    .foregroundStyle(item.type.rawValue == "good" ? Color.green : Color.red)//change color of chart based on habit type
                                    .cornerRadius(100.0)
                                }
                                .frame(width: 350,height: 160)
                            }
                        }
                    }
                    
                }
                Spacer()
                ZStack{//MARK: -- Tips
                    RoundedRectangle(cornerRadius: 18)
                        .fill(Color("widgetSet"))
                        .frame(width: 375, height: 180)
                    VStack{
                        Text("Lorem ipsum dolor sit amet consectetur. Quam tristique quis erat et egestas purus proin a enim. Viverra tempor a ut netus sit.") // -- dynamic
                            .frame(width:250, height:120)
                            .multilineTextAlignment(.center)
                            .font(.system(size: 14))
                    }
                    .italic()
                }
                /*Spacer()
                ZStack{//MARK: -- tooldbar
                    RoundedRectangle(cornerRadius: 18)
                        .fill(Color("widgetSet"))
                        .frame(width: 375, height: 70)
                    HStack{
                        Spacer()
                        Image("DashboardIcon-Dark")
                            .resizable()
                            .frame(width: 45,height:45)
                        Spacer()
                        Image("DayIcon-Dark")// -- two text fields with a function that returns the day of the week and the date of the day
                            .resizable()
                            .frame(width: 45,height:45)
                        Spacer()
                        Image("SettingIcon-Dark")
                            .resizable()
                            .frame(width: 45,height:45)
                        Spacer()
                    }
                }*/
                    
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
    let day: String
    let amount: Int
    var type: Habitype
    
}
func colorChart(){}
enum Habitype: String{
    case good, bad
}
let habitdata: [Habit] = [
    //Day 1
    Habit(weekday: "Thursday", day: "12-05-2023", amount: 2,type: Habitype.good),
    Habit(weekday: "Thursday",day: "12-05-2023", amount: 1,type: Habitype.bad),
    //Day 2
    Habit(weekday: "Friday",day: "13-05-2023", amount: 1,type: Habitype.bad),
    Habit(weekday: "Friday",day: "13-05-2023", amount: 2,type: Habitype.good),
    //Day 3
    Habit(weekday: "Monday",day: "14-05-2023", amount: 2,type: Habitype.good),
    Habit(weekday: "Monday",day: "14-05-2023", amount: 1,type: Habitype.bad),
    //Day 4
    Habit(weekday: "Wendays",day: "15-05-2023", amount: 1,type: Habitype.bad),
    Habit(weekday: "Wendays",day: "15-05-2023", amount: 2,type: Habitype.good),
    //Day 5
    Habit(weekday: "Tuesday",day: "16-05-2023", amount: 1,type: Habitype.bad),
    Habit(weekday: "Tuesday",day: "16-05-2023", amount: 2,type: Habitype.good),
    //Day 6
    Habit(weekday: "Sunday",day: "17-05-2023", amount: 1,type: Habitype.bad),
    Habit(weekday: "Sunday",day: "17-05-2023", amount: 2,type: Habitype.good),
    //Day 7
    Habit(weekday: "Saturday",day: "18-05-2023", amount: 1,type: Habitype.bad),
    Habit(weekday: "Saturday",day: "18-05-2023", amount: 2,type: Habitype.good)
]


struct ProgressBarCircle: View{//display the progress circle
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
struct CalculateProgressCircle{
    //MARK: -- calculating full week/month progress
}


struct DashboardView_Previews: PreviewProvider{
    static var previews: some View{
        DashboardView()
    }
}
