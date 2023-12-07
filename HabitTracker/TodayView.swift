//
//  TodayView.swift
//  HabitTraker
//
//  Created by Alessandro Miatello on 09/06/23.
//

import SwiftUI

struct TodayView: View {
    var body: some View {
        ZStack{
            Color("BGColor")
                .ignoresSafeArea()
            VStack{
                Text("Today")
                    .foregroundColor(.white)
            }
            
        }
    }
}
struct TodayView_Previews: PreviewProvider{
    static var previews: some View{
        TodayView()
    }
}
