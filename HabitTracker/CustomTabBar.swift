//
//  CustomTabBar.swift
//  HabitTraker
//
//  Created by Alessandro Miatello on 07/12/23.
//

import SwiftUI

struct CustomTabBar: View {
    @Binding var tabSelection: Int
    //TODO: find a way to extract the day number from the calendar (like whats done on weekday) and make a String var that is placed instead of the "6" in the tabBarItems
    let tabBarItems: [(image:String, title:String)] = [
    ("house", "Home"),
    ("6.square", "Today"),
    ("gear", "Settings")
    ]
    
    var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/)
                .frame(height: 70)
                .foregroundColor(.black)
                .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
            HStack{
                ForEach(0..<3){ index in
                    Spacer()
                    Button{
                        tabSelection = index + 1
                    } label: {
                        VStack(spacing: 8){
                            Spacer()
                            
                            Image(systemName: tabBarItems[index].image)
                            
                            Text(tabBarItems[index].title)
                            
                            Spacer()
                        }.foregroundColor(index+1 == tabSelection ? .blue : .gray)
                    }
                    Spacer()
                }
            }
            .frame(height: 80)
        }
        .ignoresSafeArea()
        .padding(.horizontal)
    }
}

struct CustomTabBar_Previews: PreviewProvider{
    static var previews: some View{
        CustomTabBar(tabSelection: .constant(1))
            .previewLayout(.sizeThatFits)
            .padding(.vertical)
    }
}
