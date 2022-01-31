//
//  RoninCardView.swift
//  RoninEMS
//
//  Created by Alvin Raygon on 6/18/21.
//

import SwiftUI

struct OnBoardingCardView: View {
    // MARK: PROPERTIES
    var model: OnboardingModel
    
    @State private var isAnimating: Bool = false
    
    // MARK: BODY
    var body: some View {
        VStack(spacing: 20) {
            // image card
            Image(model.image)
                .resizable()
                .scaledToFit()
                .shadow(color: Color(red: 0, green: 0, blue: 0,opacity: 0.15), radius: 8, x: 6, y: 8)
                .scaleEffect(isAnimating ? 1.0 : 0.6)
            // title
            Text(model.headline.uppercased())
                .font(.system(size: 30))
                .fontWeight(.heavy)
                .foregroundColor(Color("titleTextColor"))
            // headline
            Text(model.description)
                .font(.system(size: 14))
                .foregroundColor(Color("AccentColor"))
                .multilineTextAlignment(.center)
                .frame(maxWidth: 480)
                .padding(.horizontal, 10)

        }
        .onAppear {
            withAnimation(.easeOut(duration: 0.5)){
                isAnimating = true
            }
        }
        .padding(.horizontal, 24)
    }
}

struct RoninCardView_Previews: PreviewProvider {
    static var previews: some View {
        OnBoardingCardView(model: onboardingScreens[1])
            .previewLayout(.fixed(width: 320, height: 640))
    }
}
