//
//  DataManager.swift
//  Timer-Login.UserDefaults.Combine.SwiftUI.HW.3.3
//
//  Created by  Sergey Yurtaev on 14.07.2022.
//

import Foundation

class DataManager {
    
    static let shared = DataManager()
    
    private let userDataKey = "userManager"
    
    func saveUser(user: User) {
        guard let userData = try? JSONEncoder().encode(user) else { return }
        UserDefaults.standard.set(userData, forKey: userDataKey)
    }
    
    func loadUser() -> User {
        guard let userData = UserDefaults.standard.object(forKey: userDataKey) as? Data else { return User() }
        guard let user = try? JSONDecoder().decode(User.self, from: userData) else { return User() }
        return user
    }
    
    func clear(userManager: UserManager) {
        userManager.user.isRegistered = false
        userManager.user.name = ""
        UserDefaults.standard.removeObject(forKey: userDataKey)
    }
    
    
}
