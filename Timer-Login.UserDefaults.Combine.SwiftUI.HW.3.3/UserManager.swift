//
//  UserManager.swift
//  Timer-Login.UserDefaults.Combine.SwiftUI.HW.3.3
//
//  Created by  Sergey Yurtaev on 10.07.2022.
//

import Combine

final class UserManager: ObservableObject { // Любая попытка унаследовать класс приведет к ошибке компиляции, предотвращяем переопределение класса 
    
    @Published var user = User() // будем следить за изменениями этого свойства и разрешать логиниться в приложенении, если свойство равно true. будет отображаться либо экран логина или основной экран.
    
    var nameIsValid: Bool {
        user.name.count >= 3
    }
    
    init() {}
    
    init(user: User) {
        self.user = user
    }
}

struct User: Codable { // модель
    var name = ""
    var isRegistered = false
}
