//
//  StarterView.swift
//  Timer-Login.UserDefaults.Combine.SwiftUI.HW.3.3
//
//  Created by  Sergey Yurtaev on 10.07.2022.
//

import SwiftUI

struct StarterView: View {
    
    @EnvironmentObject var userManager: UserManager
    
    var saveName = UserDefaults.standard.string(forKey: "Name")
    
    var body: some View {
        Group {
            if userManager.user.isRegistered {
                TimerView()
            } else {
                RegisterView()
                    .onTapGesture {
                        UIApplication.shared.endEditing() // скрытие клавиатуры 
                    }
            }
        }
    }
}

struct StarterView_Previews: PreviewProvider {
    static var previews: some View {
        StarterView()
            .environmentObject(UserManager())
    }
}

extension UIApplication {
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
