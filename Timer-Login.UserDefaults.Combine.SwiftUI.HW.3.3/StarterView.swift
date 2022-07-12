//
//  StarterView.swift
//  Timer-Login.UserDefaults.Combine.SwiftUI.HW.3.3
//
//  Created by  Sergey Yurtaev on 10.07.2022.
//

import SwiftUI

struct StarterView: View {
    @EnvironmentObject var user: UserManager
    
    var saveName = UserDefaults.standard.string(forKey: "Name")
    
    var body: some View {
        Group {
            if user.isRegister {
                ContentView()
            } else {
                RegisteredView()
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
