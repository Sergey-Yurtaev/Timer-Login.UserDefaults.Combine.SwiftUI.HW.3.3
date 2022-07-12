//
//  UserManager.swift
//  Timer-Login.UserDefaults.Combine.SwiftUI.HW.3.3
//
//  Created by  Sergey Yurtaev on 10.07.2022.
//

import Combine
import SwiftUI

class UserManager: ObservableObject {
    
    @Published var isRegister  = false // будем следить за изменениями этого свойства и разрешать логиниться в приложенении, если свойство равно true. будет отображаться либо экран логина или основной экран.
    
    var name = ""
    
    init() {}
    
    init(name: String) {
        self.name = name
    }

    func delete() {
        UserDefaults.standard.set("", forKey: "Name")
    }
}
