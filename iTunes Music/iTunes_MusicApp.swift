//
//  iTunes_MusicApp.swift
//  iTunes Music
//
//  Created by Ramy Sabry on 20/07/2021.
//

import SwiftUI

@main
struct iTunes_MusicApp: App {
    
    @Environment(\.scenePhase) var scenePhase
    
    init() {
        
    }
    
    var body: some Scene {
        WindowGroup {
            MusicListView()
        }
        .onChange(of: scenePhase) { phase in
            switch phase {
            case .background:
                break
            case .inactive:
                break
            case .active:
                break
            @unknown default:
                break
            }
        }
    }
}
