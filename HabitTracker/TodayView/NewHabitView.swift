//
//  NewHabitView.swift
//  HabitTracker
//
//  Created by Alessandro Miatello on 02/02/24.
//

import Foundation
import SwiftUI
import SwiftData
import SymbolPicker

struct NewHabitView: View{
    
    @Environment(\.modelContext) private var context
    @Environment(\.dismiss) private var dismiss
    
    //@Binding var isShowingNewHabitForm: Bool
    @State var name = ""
    @State var icon = "circle.fill"
    @State var isPresented = false
    @State var type = 1
    @State var weekDays: [Int] = []
    
    var body: some View{
        NavigationStack{
            VStack(alignment: .leading, spacing: 10.0){
                TextField("Insert the name of the habit", text: $name).preferredColorScheme(.dark)
                    .padding()
                    //.background(Color("widgetSet").cornerRadius(15))
                HStack{
                    Picker("", selection: $type){
                        Text("Good")
                            .tag(1)
                        Text("Bad")
                            .tag(0)
                    }.frame(width: UIScreen.main.bounds.width * 0.75)
                        .pickerStyle(.palette).foregroundStyle(Color.gray)
                }
                VStack{
                    HStack{
                        Text("Select a day")
                            .foregroundStyle(Color("fontColor"))
                            .font(.system(size:18))
                            .fontWeight(.bold)
                        Spacer()
                    }
//                  MARK: Custom picker per i giorni che ritorna un array di int
                    FrequencyPicker(selection: $weekDays)
                }.frame(width: UIScreen.main.bounds.width * 0.75)
                HStack{
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
            }.frame(width: UIScreen.main.bounds.width * 0.85)
                .navigationTitle("Create a new Habit")
                .navigationBarTitleDisplayMode(.inline)
                .toolbar{
                    ToolbarItem(placement: .confirmationAction){
                        Button(action:{
                            //print("Done Clicked")
                            if(name != ""){
                                // self.isShowingNewHabitForm.toggle()
                                //print("toggled")
                                saveHabit(name: name, image: icon, type: type == 1 ? Habitype.good : Habitype.bad)
                                //print("savehabit called")
                                dismiss()
                            }
                        }, label:{
                            Text("Done").foregroundStyle(Color.white)
                        })
                        
                    }
                    ToolbarItem(placement: .cancellationAction){
                        Button(action: {
                            //self.isShowingNewHabitForm.toggle()
                            dismiss()
                        }, label: {
                            Text("Cancel").foregroundStyle(Color.white)
                        })
                    }
                }
        }
        .presentationDragIndicator(.visible)
        .presentationDetents([.fraction(0.40)])
    }
    func saveHabit(name: String, image: String, type: Habitype){
        print("weekdays: ", weekDays.description)
        //print("Entered saveHabit")
        let habit : Habit
        //print("habit created")
        habit = Habit(name: name, image: image, type: type, specificDay: weekDays)
        //print("Habit created uuid: ", habit.id)
        context.insert(habit)
        //print("Habit saved")
    }
}
#Preview{
    NewHabitView()
}
