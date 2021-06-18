//
//  OnboardingView.swift
//  RoninEMS
//
//  Created by Alvin Raygon on 6/18/21.
//

import SwiftUI

struct OnboardingView: View {
    // MARK: - PROPERTIES
    var items : [OnboardingModel] = onboardingScreens
    
    var body: some View {
        VStack {
            OnboardingTopMenu()
            TabView(selection: $selectedPage) {
                ForEach(items[0..<items.count]) { item in
                    OnBoardingCardView(model: item)
                }
            }
            .tabViewStyle(PageTabViewStyle())
            NextButtonView()
        }
    }
}



struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView(items: onboardingScreens)
            .previewDevice("iPhone 11 Pro")
    }
}
