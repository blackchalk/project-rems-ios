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
    @State private var selectedPage : Int = 0
    @State private var showGetStarted = false
    
    var body: some View {
        VStack {
            OnboardingTopMenu(shouldShowGetStarted: $showGetStarted)
            TabView (selection: $selectedPage){
                ForEach(items[0..<items.count]) { item in
                    OnBoardingCardView(model: item).tag(item.id)
                }
            }
            .tabViewStyle(PageTabViewStyle())
            OnboardingBottomMenu(selectedPage:$selectedPage)
        }
    }
}



struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            OnboardingView(items: onboardingScreens)
                .previewDevice("iPhone 12 Pro Max")
//            OnboardingView(items: onboardingScreens)
//                .previewDevice("iPhone SE")
        }
    }
}
