//
//  NextButtonView.swift
//  RoninEMS
//
//  Created by Alvin Raygon on 6/18/21.
//

import SwiftUI

struct GetStartedButtonView: View {
    
    @AppStorage("isOnboarding") var isOnboarding: Bool?
    var body: some View {
        Button(action: {
            isOnboarding = false
            // go to next page
            print("onclick GetStartedButtonView")
        }) {
            HStack(spacing: 8) {
                Text("Get Started")
                    .font(.callout)
                    .fontWeight(.bold)
            }
            .foregroundColor(.white)
            .padding(.horizontal, 32)
            .padding(.vertical, 15)
        }
        .background(Color("titleTextColor"))
        .accentColor(.primary)
    }
}

struct GetStartedButtonView_Previews: PreviewProvider {
    static var previews: some View {
        GetStartedButtonView()
            .previewLayout(.sizeThatFits)
    }
}
