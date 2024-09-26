//
//  FrequencyPicker.swift
//  HabitTracker
//
//  Created by Alessandro Miatello on 07/02/24.
//

import SwiftUI

//struct FrequencyPicker: View{
//    @Binding var selection : [Int]
//    @State var weekDays: [String : Bool] = [
//        "MON" : false,
//        "TUE" : false,
//        "WED" : false,
//        "THU" : false,
//        "FRI" : false,
//        "SAT" : false,
//        "SUN" : false
//    ]
//    
//    var body: some View {
//        VStack{
//            HStack{
//                Text("MON")
//                    .padding(4)
//                    .background(weekDays["MON"]! ? Color.gray : Color("widgetSet"))
//                    .clipShape(RoundedRectangle(cornerRadius: 10))
//                    .onTapGesture {
////                        print("Initial value: ",selection.description)
//                        weekDays["MON"]?.toggle()
//                        print(weekDays["MON"]!)
//                        if weekDays["MON"]!{
//                            selection.append(1)
//                        }else{
//                            selection.removeAll{$0 == 1}
//                        }
////                        print("Updated value: ",selection.description)
//                    }
//                
//                Text("TUE")
//                    .padding(4)
//                    .background(weekDays["TUE"]! ? Color.gray : Color("widgetSet"))
//                    .clipShape(RoundedRectangle(cornerRadius: 10))
//                    .onTapGesture {
////                        print("Initial value: ",selection.description)
//                        weekDays["TUE"]?.toggle()
//                        print(weekDays["TUE"]!)
//                        if weekDays["TUE"]!{
//                            selection.append(2)
//                        }else{
//                            selection.removeAll{$0 == 2}
//                        }
////                        print("Updated value: ",selection.description)
//                    }
//                Text("WED")
//                    .padding(4)
//                    .background(weekDays["WED"]! ? Color.gray : Color("widgetSet"))
//                    .clipShape(RoundedRectangle(cornerRadius: 10))
//                    .onTapGesture {
////                        print("Initial value: ",selection.description)
//                        weekDays["WED"]?.toggle()
//                        print(weekDays["WED"]!)
//                        if weekDays["WED"]!{
//                            selection.append(3)
//                        }else{
//                            selection.removeAll{$0 == 3}
//                        }
////                        print("Updated value: ",selection.description)
//                    }
//                Text("THU")
//                    .padding(4)
//                    .background(weekDays["THU"]! ? Color.gray : Color("widgetSet"))
//                    .clipShape(RoundedRectangle(cornerRadius: 10))
//                    .onTapGesture {
////                        print("Initial value: ",selection.description)
//                        weekDays["THU"]?.toggle()
//                        print(weekDays["THU"]!)
//                        if weekDays["THU"]!{
//                            selection.append(4)
//                        }else{
//                            selection.removeAll{$0 == 4}
//                        }
////                        print("Updated value: ",selection.description)
//                    }
//                Text("FRI")
//                    .padding(4)
//                    .background(weekDays["FRI"]! ? Color.gray : Color("widgetSet"))
//                    .clipShape(RoundedRectangle(cornerRadius: 10))
//                    .onTapGesture {
////                        print("Initial value: ",selection.description)
//                        weekDays["FRI"]?.toggle()
//                        print(weekDays["FRI"]!)
//                        if weekDays["FRI"]!{
//                            selection.append(5)
//                        }else{
//                            selection.removeAll{$0 == 5}
//                        }
////                        print("Updated value: ",selection.description)
//                    }
//                Text("SAT")
//                    .padding(4)
//                    .background(weekDays["SAT"]! ? Color.gray : Color("widgetSet"))
//                    .clipShape(RoundedRectangle(cornerRadius: 10))
//                    .onTapGesture {
////                        print("Initial value: ",selection.description)
//                        weekDays["SAT"]?.toggle()
//                        print(weekDays["SAT"]!)
//                        if weekDays["SAT"]!{
//                            selection.append(6)
//                        }else{
//                            selection.removeAll{$0 == 6}
//                        }
////                        print("Updated value: ",selection.description)
//                    }
//                Text("SUN")
//                    .padding(4)
//                    .background(weekDays["SUN"]! ? Color.gray : Color("widgetSet"))
//                    .clipShape(RoundedRectangle(cornerRadius: 10))
//                    .onTapGesture {
////                        print("Initial value: ",selection.description)
//                        weekDays["SUN"]?.toggle()
//                        print(weekDays["SUN"]!)
//                        if weekDays["SUN"]!{
//                            selection.append(7)
//                        }else{
//                            selection.removeAll{$0 == 7}
//                        }
////                        print("Updated value: ",selection.description)
//                    }
//            }.font(.system(size: 13))
//            Text("DAILY")
//                
//        }
//    }
//    
//}

struct FrequencyPicker: View {
    @Binding var selection: [Int]
    @State var weekDays: [String : Bool] = [
        "MON": false,
        "TUE": false,
        "WED": false,
        "THU": false,
        "FRI": false,
        "SAT": false,
        "SUN": false
    ]
    @State var dailySelected = false
    let weekDaysOrder = ["MON", "TUE", "WED", "THU", "FRI", "SAT", "SUN"]


    var body: some View {
        VStack {
            HStack { // Print weekdays using foreach --> more efficient
                ForEach(weekDaysOrder, id: \.self) { day in
                    Text(day)
                        .padding(4)
                        .background(weekDays[day]! ? Color.gray : Color("widgetSet"))
                        .clipShape(RoundedRectangle(cornerRadius: 2))
                        .onTapGesture {
                            weekDays[day]?.toggle()

                            // Update selection based on the day of the week
                            let dayIndex = getDayIndex(from: day)
                            if weekDays[day]! {
                                selection.append(dayIndex)
                            } else {
                                selection.removeAll { $0 == dayIndex }
                            }
                            // Disable daily option if any specific day is selected
                            dailySelected = selection.count == 7
                        }
                }
            }.font(.system(size: 13))

            // Add a button or toggle for "Daily" selection
            Button(action: {
                dailySelected.toggle()

                if dailySelected {
                    // If Daily is selected, add all days (1 to 7) and mark weekdays
                    selection = Array(1...7)
                    weekDays = weekDays.mapValues { _ in true }
                } else {
                    // If Daily is deselected, clear all selections
                    selection.removeAll()
                    weekDays = weekDays.mapValues { _ in false }
                }
            }) {
                Text("DAILY")
                    .padding(.horizontal, 10)
                    .background(dailySelected ? Color.gray : Color("widgetSet"))
                    .clipShape(RoundedRectangle(cornerRadius: 4))
                    .foregroundColor(.white)
            }
        }
    }

    // Helper function to get day index (e.g., MON -> 1, TUE -> 2, etc.)
    func getDayIndex(from day: String) -> Int {
        switch day {
        case "MON": return 1
        case "TUE": return 2
        case "WED": return 3
        case "THU": return 4
        case "FRI": return 5
        case "SAT": return 6
        case "SUN": return 7
        default: return 0
        }
    }
}
