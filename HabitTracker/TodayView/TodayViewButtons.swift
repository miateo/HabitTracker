//
//  TodayViewButtons.swift
//  HabitTracker
//
//  Created by Alessandro Miatello on 05/02/24.
//

import SwiftUI

struct TodayViewButtons: View {
    
    @State private var isShowingNewHabitForm = false
    @State private var isShowingAllHabits = false
    @State var filter = ""
    
    var body: some View {
        HStack(alignment: .center){
            //button to create new habit
            Button("Create new habit"){
                isShowingNewHabitForm.toggle()
            }
            .frame(width: UIScreen.main.bounds.width * 0.465, height: 60)
            .background(Color("widgetSet"))
            .clipShape(RoundedRectangle(cornerRadius: 20))
            .foregroundStyle(Color("fontColor"))
            .font(.system(size: 18))
            .fontWeight(.bold)
            .sheet(isPresented: $isShowingNewHabitForm, content: {
                NewHabitView()
                    .presentationBackground(Color("widgetSet"))
            })
            Button("See all habits") {
                isShowingAllHabits.toggle()
            }
            .frame(width: UIScreen.main.bounds.width * 0.465, height: 60)
            .background(Color("widgetSet"))
            .clipShape(RoundedRectangle(cornerRadius: 20))
            .foregroundStyle(Color("fontColor"))
            .font(.system(size: 18))
            .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
            .sheet(isPresented: $isShowingAllHabits, content: {
                NavigationStack{
                    AllHabits(filterString: filter)
                        .searchable(text: $filter,placement: .navigationBarDrawer(displayMode: .always), prompt: Text("Filter for habit name"))
                        .presentationBackground(Color("widgetSet"))
                        
                }.presentationBackground(Color("widgetSet"))
                .presentationDetents([.medium])
                .presentationDragIndicator(.visible)
                
            })
        }
    }
}

#Preview {
    TodayViewButtons()
}
