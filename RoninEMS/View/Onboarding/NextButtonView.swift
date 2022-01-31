//
//  NextButtonView.swift
//  RoninEMS
//
//  Created by Alvin Raygon on 6/18/21.
//

import SwiftUI

struct NextButtonView: View {
    @Binding var shouldShowGetStarted : Bool
    @Binding var selectedPage : Int
    var body: some View {
        Button(action: {
            
            if selectedPage < 2 {
                withAnimation {
                    selectedPage += 1
                }}else{
                    selectedPage = 0
                    shouldShowGetStarted = true
                }
        }) {
            HStack(spacing: 8) {
                Text("Next")
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

struct NextButtonView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            NextButtonView(shouldShowGetStarted: .constant(true), selectedPage: .constant(0))
                .preferredColorScheme(.dark)
                .previewLayout(.sizeThatFits)
            NextButtonView(shouldShowGetStarted: .constant(false), selectedPage: .constant(0))
                .preferredColorScheme(.light)
                .previewLayout(.sizeThatFits)
        }
    }
}
