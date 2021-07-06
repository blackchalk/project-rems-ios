//
//  RoninEMSApp.swift
//  RoninEMS
//
//  Created by Alvin Raygon on 6/16/21.
//

import SwiftUI

@main
struct RoninEMSApp: App {
    @AppStorage("isOnboarding") var isOnboarding: Bool = true
    
    var body: some Scene {
        WindowGroup {
            if isOnboarding {
                OnboardingView()
            } else {
                ContentView()
            }
        }
    }
}
