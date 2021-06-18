//
//  NextButtonView.swift
//  RoninEMS
//
//  Created by Alvin Raygon on 6/18/21.
//

import SwiftUI

struct NextButtonView: View {
    @AppStorage("isOnBoarding") var isOnBoarding: Bool?
    var body: some View {
        Button(action: {
            isOnBoarding = false
        }, label: {
            Text("Next")
        })
    }
}

struct NextButtonView_Previews: PreviewProvider {
    static var previews: some View {
        NextButtonView()
    }
}
