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
    @Environment(\.modelContext) private var context
    @Query private var habits: [Habit]
    
    var body: some View {
        ZStack{
            Color("BGColor").ignoresSafeArea()
            
            VStack(alignment: .center){
                Spacer(minLength: 2)
                Text("Log your Habits!")
                 .foregroundStyle(Color("fontColor"))
                 .font(.system(size:24))
                 .fontWeight(.bold)
                Spacer()
                // Most used habits
                //displayMostUsed()
                
                List{
                    ForEach(habits){ item in
                        DisplayAllHabits(habit: item)
                    }.onDelete { itemSet in
                        for item in itemSet{
                            context.delete(habits[item])
                        }
                    }
                    
                }.scrollDisabled(true)
                    .scrollContentBackground(.hidden)
                    .listRowSpacing(10.0)
                    .frame(height: UIScreen.main.bounds.height * 0.4)
                
                
                HStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/){
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
                    })
                    Button("See all habits") {}
                        .frame(width: UIScreen.main.bounds.width * 0.465, height: 60)
                        .background(Color("widgetSet"))
                        .clipShape(RoundedRectangle(cornerRadius: 20))
                        .foregroundStyle(Color("fontColor"))
                        .font(.system(size: 18))
                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                    //button to view all habits
                }
                Spacer(minLength: 3)
            }
        }
    }
}
struct TodayView_Previews: PreviewProvider{
    static var previews: some View{
        TodayView()
    }
}
