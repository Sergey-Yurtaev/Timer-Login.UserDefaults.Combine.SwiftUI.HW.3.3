//
//  RegisteredView.swift
//  Timer-Login.UserDefaults.Combine.SwiftUI.HW.3.3
//
//  Created by  Sergey Yurtaev on 10.07.2022.
//

import SwiftUI

struct RegisteredView: View {
    @State private var name =  UserDefaults.standard.string(forKey: "Name") ?? ""
    @EnvironmentObject var user: UserManager
    
    var body: some View {
        
        VStack {
            HStack {
                TextField("Enter your name", text: $name)
                    .multilineTextAlignment(.center)
                CountText(name: name)
                    .foregroundColor(textColor)
            }
            Button {
                registerUser()
            } label: {
                HStack {
                    Image(systemName: "checkmark.circle")
                    Text("OK")
                }
            }
            .disabled(!validCount)
        }
    }
    
    
    var validCount: Bool {
        name.count >= 3
    }
    
    var textColor: Color {
        validCount ? .green : .blue
    }
    
}

struct CountText: View {
    
    var name: String
    
    var body: some View {
        Text("\(name.count)")
            .offset(x: -30, y: 0)
    }
}

extension RegisteredView {
    private func registerUser() {
        if !name.isEmpty {
            user.name = name
            UserDefaults.standard.set(self.user.name, forKey: "Name")
            user.isRegister = true
        }
    }
}

struct RegisteredView_Previews: PreviewProvider {
    static var previews: some View {
        RegisteredView()
            .environmentObject(UserManager())
    }
}
