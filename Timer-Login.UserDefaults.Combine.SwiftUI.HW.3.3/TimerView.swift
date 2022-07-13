//
//  ContentView.swift
//  Timer-Login.UserDefaults.Combine.SwiftUI.HW.3.3
//
//  Created by  Sergey Yurtaev on 06.07.2022.
//

import SwiftUI

struct TimerView: View {
    
    @ObservedObject var timer = TimeCounter()
    @EnvironmentObject var userManager: UserManager
            
    var body: some View {
        VStack {
            Text("Hi, \(userManager.user.name)")
                .font(.largeTitle)
                .offset(x: 0, y: 100)
            Text("\(timer.counter)")
                .font(.largeTitle)
                .offset(x: 0, y: 200)
            
            Spacer()
            
            VStack {
                Spacer()
                
                ActionButtonView(title: timer.buttonTitle, color: .red) {
                    timer.startTimer()
                }
                
                Spacer()

                ActionButtonView(
                    title: "LogOut",
                    color: .blue,
                    isRegistered: $userManager.user.isRegistered,
                    userName: $userManager.user.name
                ) {
                    DataManager.shared.clear(userManager: userManager)
                }
            }
        }
    }
}

struct TimerView_Previews: PreviewProvider {
    static var previews: some View {
        TimerView()
        .environmentObject(UserManager())
    }
}

