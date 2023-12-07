//
//  TabView.swift
//  HabitTraker
//
//  Created by Alessandro Miatello on 09/06/23.
//

import SwiftUI

struct AllViewConn: View {
    @State private var tabSelection = 1
    var body: some View {
        TabView(selection: $tabSelection){
            DashboardView()
                .tag(1)
            TodayView()
                .tag(2)
            Text("Settings")
                .tag(3)
        }
        .overlay(alignment: .bottom){
            CustomTabBar(tabSelection: $tabSelection)
        }
        .accentColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
        
            
    }
}

struct TabView_Previews: PreviewProvider {
    static var previews: some View {
        AllViewConn()
    }
}
