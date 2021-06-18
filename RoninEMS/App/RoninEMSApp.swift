//
//  RoninEMSApp.swift
//  RoninEMS
//
//  Created by Alvin Raygon on 6/16/21.
//

import SwiftUI

@main
struct RoninEMSApp: App {
    @AppStorage("isOnBoarding") var isOnBoarding: Bool = true
    
    var body: some Scene {
        WindowGroup {
            if isOnBoarding {
                OnboardingView()
            } else {
                ContentView()
            }
        }
    }
}
