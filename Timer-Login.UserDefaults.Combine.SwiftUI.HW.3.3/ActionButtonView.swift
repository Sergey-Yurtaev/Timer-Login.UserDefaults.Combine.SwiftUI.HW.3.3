//
//  ActionButtonView.swift
//  Timer-Login.UserDefaults.Combine.SwiftUI.HW.3.3
//
//  Created by  Sergey Yurtaev on 14.07.2022.
//

import SwiftUI

struct ActionButtonView: View { // кнопка для переиспользования так создана
    @Binding var isRegistered: Bool
    @Binding var userName: String
    
    let title: String
    let color: Color
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            Text(title)
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(.white)
        }
        .buttonAppearance(color) // касстомный модификатор для передачи цвета
    }
    
    init(title: String, color: Color, isRegistered: Binding<Bool> = .constant(false), userName: Binding<String> = .constant(""), action: @escaping () -> Void) {
        self.title = title
        self.color = color
        self._isRegistered = isRegistered
        self._userName = userName
        self.action = action
    }
}

struct ActionButtonView_Previews: PreviewProvider {
    static var previews: some View {
        ActionButtonView(title: "Some Action", color: .red, action: {})
    }
}
