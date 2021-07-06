//
//  OnboardingTopMenu.swift
//  RoninEMS
//
//  Created by Alvin Raygon on 6/18/21.
//

import SwiftUI

struct OnboardingTopMenu: View {
    var body: some View {
        HStack {
            Image("ronin_logo_final")
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding()
            SkipButtonView()
                .frame(maxWidth: .infinity, alignment: .trailing)
                .padding()
        }
    }
}

struct OnboardingTopMenu_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingTopMenu()
            .previewLayout(.sizeThatFits)
    }
}
