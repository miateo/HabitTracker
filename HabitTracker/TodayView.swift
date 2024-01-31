//
//  TodayView.swift
//  HabitTraker
//
//  Created by Alessandro Miatello on 09/06/23.
//
/* This view is made to be able to log the differents type of habits made by the user
    it records:
        - What habit have been logged & how many times
        - If 
 */
import SwiftUI
import SwiftData

struct TodayView: View {
    @State private var isShowingNewHabitForm = false
    var body: some View {
        ZStack(alignment: .leading){
            Color("BGColor")
                .ignoresSafeArea()
            VStack{
                // WeekView
                Text("Log your Habits!")
                    .foregroundStyle(Color("fontColor"))
                    .font(.system(size:24))
                    .fontWeight(.bold)
                // Most used habits
                //displayMostUsed()
                DisplayHabit(habit: habitData[0])
                DisplayHabit(habit: habitData[1])
                DisplayHabit(habit: habitData[2])
                
                HStack{
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
                            NavigationStack{
                                ModifyHabit(isShowingNewHabitForm: $isShowingNewHabitForm)
                                    .frame(width: UIScreen.main.bounds.width * 0.75)
                            }
                            .presentationBackground(Color("widgetSet"))
                            .presentationDragIndicator(.visible)
                            .presentationDetents([.fraction(0.40)])
                            .navigationTitle("")
                            .navigationBarHidden(true)
                        })
                    
                    Button("See all habits") {
                        
                    }
                    .frame(width: UIScreen.main.bounds.width * 0.465, height: 60)
                        .background(Color("widgetSet"))
                        .clipShape(RoundedRectangle(cornerRadius: 20))
                        .foregroundStyle(Color("fontColor"))
                        .font(.system(size: 18))
                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)

                    
                    //button to view all habits
                }
            }
            
        }.background(Color("BGColor"))
    }
}
struct TodayView_Previews: PreviewProvider{
    static var previews: some View{
        TodayView()
    }
}
