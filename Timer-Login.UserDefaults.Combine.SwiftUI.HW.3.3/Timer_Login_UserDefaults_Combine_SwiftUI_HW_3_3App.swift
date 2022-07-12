//
//  Timer_Login_UserDefaults_Combine_SwiftUI_HW_3_3App.swift
//  Timer-Login.UserDefaults.Combine.SwiftUI.HW.3.3
//
//  Created by  Sergey Yurtaev on 06.07.2022.
//

import SwiftUI

@main
struct Timer_Login_UserDefaults_Combine_SwiftUI_HW_3_3App: App {
    var body: some Scene {
        WindowGroup {
            StarterView().environmentObject(UserManager())
        }
    }
}
