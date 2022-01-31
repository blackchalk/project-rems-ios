//
//  OnboardingBottomMenu.swift
//  RoninEMS
//
//  Created by Alvin Raygon on 1/30/22.
//

import SwiftUI

struct OnboardingBottomMenu: View {
    @AppStorage("isOnboarding") var isOnboarding: Bool?
    @State private var shouldShowGetStarted: Bool = false
    @Binding var selectedPage : Int
    var body: some View{
        VStack {
            if shouldShowGetStarted {
                GetStartedButtonView()
                    .frame(maxWidth: .infinity, alignment: .center)
                        .padding()
            }

            NextButtonView(shouldShowGetStarted: $shouldShowGetStarted, selectedPage: $selectedPage).frame(maxWidth: .infinity, alignment: .trailing)
                .padding()
                .opacity(shouldShowGetStarted ? 0 : 1)
        }
    }
}

struct OnboardingBottomMenu_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingBottomMenu(selectedPage: .constant(0))
            .previewLayout(.sizeThatFits)
    }
}
