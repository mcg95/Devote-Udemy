//
//  HideKeyboardExtension.swift
//  Devote-udemy
//
//  Created by Mewan on 19/04/2021.
//

import SwiftUI

#if canImport(UIKit)
extension View {
    func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
#endif
