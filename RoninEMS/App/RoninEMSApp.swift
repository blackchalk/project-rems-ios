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
    @State var enteringLoginPage: Bool = false
    var body: some Scene {
        WindowGroup {
            if isOnboarding {
                OnboardingView()
            } else if enteringLoginPage {
                LoginView()
            }else{
                SignUpView(enteringLoginPage: $enteringLoginPage)
            }
        }
    }
}
