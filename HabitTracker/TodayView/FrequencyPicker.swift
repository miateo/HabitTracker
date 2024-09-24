//
//  FrequencyPicker.swift
//  HabitTracker
//
//  Created by Alessandro Miatello on 07/02/24.
//

import SwiftUI

struct FrequencyPicker: View{
    @Binding var selection : [Int]
    @State var weekDays: [String : Bool] = [
        "MON" : false,
        "TUE" : false,
        "WED" : false,
        "THU" : false,
        "FRI" : false,
        "SAT" : false,
        "SUN" : false
    ]
    
    var body: some View {
        VStack{
            HStack{
                Text("MON")
                    .padding(4)
                    .background(weekDays["MON"]! ? Color.gray : Color("widgetSet"))
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    .onTapGesture {
//                        print("Initial value: ",selection.description)
                        weekDays["MON"]?.toggle()
                        print(weekDays["MON"]!)
                        if weekDays["MON"]!{
                            selection.append(1)
                        }else{
                            selection.removeAll{$0 == 1}
                        }
//                        print("Updated value: ",selection.description)
                    }
                
                Text("TUE")
                    .padding(4)
                    .background(weekDays["TUE"]! ? Color.gray : Color("widgetSet"))
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    .onTapGesture {
//                        print("Initial value: ",selection.description)
                        weekDays["TUE"]?.toggle()
                        print(weekDays["TUE"]!)
                        if weekDays["TUE"]!{
                            selection.append(2)
                        }else{
                            selection.removeAll{$0 == 2}
                        }
//                        print("Updated value: ",selection.description)
                    }
                Text("WED")
                    .padding(4)
                    .background(weekDays["WED"]! ? Color.gray : Color("widgetSet"))
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    .onTapGesture {
//                        print("Initial value: ",selection.description)
                        weekDays["WED"]?.toggle()
                        print(weekDays["WED"]!)
                        if weekDays["WED"]!{
                            selection.append(3)
                        }else{
                            selection.removeAll{$0 == 3}
                        }
//                        print("Updated value: ",selection.description)
                    }
                Text("THU")
                    .padding(4)
                    .background(weekDays["THU"]! ? Color.gray : Color("widgetSet"))
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    .onTapGesture {
//                        print("Initial value: ",selection.description)
                        weekDays["THU"]?.toggle()
                        print(weekDays["THU"]!)
                        if weekDays["THU"]!{
                            selection.append(4)
                        }else{
                            selection.removeAll{$0 == 4}
                        }
//                        print("Updated value: ",selection.description)
                    }
                Text("FRI")
                    .padding(4)
                    .background(weekDays["FRI"]! ? Color.gray : Color("widgetSet"))
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    .onTapGesture {
//                        print("Initial value: ",selection.description)
                        weekDays["FRI"]?.toggle()
                        print(weekDays["FRI"]!)
                        if weekDays["FRI"]!{
                            selection.append(5)
                        }else{
                            selection.removeAll{$0 == 5}
                        }
//                        print("Updated value: ",selection.description)
                    }
                Text("SAT")
                    .padding(4)
                    .background(weekDays["SAT"]! ? Color.gray : Color("widgetSet"))
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    .onTapGesture {
//                        print("Initial value: ",selection.description)
                        weekDays["SAT"]?.toggle()
                        print(weekDays["SAT"]!)
                        if weekDays["SAT"]!{
                            selection.append(6)
                        }else{
                            selection.removeAll{$0 == 6}
                        }
//                        print("Updated value: ",selection.description)
                    }
                Text("SUN")
                    .padding(4)
                    .background(weekDays["SUN"]! ? Color.gray : Color("widgetSet"))
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    .onTapGesture {
//                        print("Initial value: ",selection.description)
                        weekDays["SUN"]?.toggle()
                        print(weekDays["SUN"]!)
                        if weekDays["SUN"]!{
                            selection.append(7)
                        }else{
                            selection.removeAll{$0 == 7}
                        }
//                        print("Updated value: ",selection.description)
                    }
            }.font(.system(size: 13))
        }
    }
    
}
//
//#Preview {
//    var select: [Int] = []
//    FrequencyPicker(selection: select)
//}
