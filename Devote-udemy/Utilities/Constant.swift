//
//  Constant.swift
//  Devote-udemy
//
//  Created by Mewan on 19/04/2021.
//

import SwiftUI

// MARK: Formatter

let itemFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateStyle = .short
    formatter.timeStyle = .medium
    return formatter
}()

// MARK: UI

var backgroundGradient: LinearGradient {
    return LinearGradient(gradient: Gradient(colors: [Color.pink, Color.blue]), startPoint: .topLeading, endPoint: .bottomTrailing)
}

// MARK: UX

let feedback = UINotificationFeedbackGenerator()
