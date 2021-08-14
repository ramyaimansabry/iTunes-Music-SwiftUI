//
//  Alerts.swift
//  iTunes Music
//
//  Created by Ramy Sabry on 26/07/2021.
//

import SwiftUI


struct AlertItem: Identifiable {
    let id = UUID()
    let title: Text
    let message: Text
    let buttonTitle: Text
    
    init(title: String, message: String, buttonTitle: String = "OK") {
        self.title = Text(title)
        self.message = Text(message)
        self.buttonTitle = Text(buttonTitle)
    }
}
