//
//  ContentView.swift
//  Timer-Login.UserDefaults.Combine.SwiftUI.HW.3.3
//
//  Created by  Sergey Yurtaev on 06.07.2022.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject private var timer = TimeCounter()
    @EnvironmentObject var user: UserManager // синглтон в swiftUI
    
    var body: some View {
        VStack {
            Text("Hello, \(user.name)!")
                .font(.largeTitle)
                .offset(x: 0, y: 100)
            Text("\(timer.counter)")
                .font(.largeTitle)
                .offset(x: 0, y: 200)
            Spacer()
            ButtonView(timer: timer)
            Spacer()
            LogOutButton()
                .offset(x: 0, y: -30)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(UserManager())
    }
}

struct ButtonView: View {
    
    @ObservedObject var timer: TimeCounter
    
    var body: some View {
        Button {
            timer.startTimer()
        } label: {
            Text("\(timer.buttonTitle)")
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundColor(.white)
        }
        .frame(width: 200, height: 60)
        .background(.red)
        .cornerRadius(20)
        .overlay(
            RoundedRectangle(cornerRadius: 20, style: .continuous)
                .stroke(Color.black, lineWidth: 4)
        )
    }
}

struct LogOutButton: View {
    
    @EnvironmentObject var user: UserManager
    
    var body: some View {
        Button {
            user.delete()
            user.isRegister = false
        } label: {
            Text("LogOut")
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundColor(.white)
        }
        .frame(width: 200, height: 60)
        .background(.green)
        .cornerRadius(20)
        .overlay(
            RoundedRectangle(cornerRadius: 20, style: .continuous)
                .stroke(Color.black, lineWidth: 4)
        )
    }
}
