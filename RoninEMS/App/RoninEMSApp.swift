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
    @AppStorage("accessToken") var accessToken: String = ""
    @AppStorage("isRememberMe") var isRememberMe: Bool = false
    @State var enteringLoginPage: Bool = false
    @State var isAuthenticated: Bool = false
    @StateObject var accountVM = AccountViewModel()
    var body: some Scene {
        WindowGroup {
            if isOnboarding {
                OnboardingView()
            } else if enteringLoginPage{
                if isAuthenticated {
                    HomeView()
                        .environmentObject(accountVM)
                }else{
                    // Proceed to Login Page
                    LoginView(isAuthenticated: $isAuthenticated)
                        .environmentObject(accountVM)
                }
            }else{
                SignUpView(enteringLoginPage: $enteringLoginPage)
            }
        }
    }
}
