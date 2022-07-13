//
//  RegisteredView.swift
//  Timer-Login.UserDefaults.Combine.SwiftUI.HW.3.3
//
//  Created by  Sergey Yurtaev on 10.07.2022.
//

import SwiftUI

struct RegisterView: View {
    
    @EnvironmentObject var userManager: UserManager
    
    var body: some View {
        VStack {
            UserNameTF(name: $userManager.user.name, nameIsValid: userManager.nameIsValid)
            Button(action: registerUser) {
                HStack {
                    Image(systemName: "checkmark.circle")
                    Text("OK")
                }
            }
            .disabled(!userManager.nameIsValid)
        }
        .padding()
    }
}

extension RegisterView {
    func registerUser() {
        if !userManager.user.name.isEmpty {
            userManager.user.isRegistered = true
            DataManager.shared.saveUser(user: userManager.user)
        }
    }
}

struct UserNameTF: View {
    
    @Binding var name: String
    var nameIsValid = false
    
    var body: some View {
        ZStack {
            TextField("Type your name...", text: $name)
                .multilineTextAlignment(.center)
            HStack {
                Spacer()
                Text("\(name.count)")
                    .font(.callout)
                    .foregroundColor(nameIsValid ? .green : .red)
                    .padding([.top, .trailing])
            }
            .padding(.bottom)
        }
    }
}

struct Register_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
        .environmentObject(UserManager())
    }
}
