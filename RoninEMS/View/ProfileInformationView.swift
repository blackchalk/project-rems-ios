//
//  ProfileInformationView.swift
//  RoninEMS
//
//  Created by Alvin Raygon on 2/14/22.
//

import SwiftUI

struct ProfileInformationView: View {

    var body: some View {
            Button(action: {
                // go to next page
            }) {
                Text("Logout")
                    .font(.title3)
                    .fontWeight(.bold)
                    .frame(maxWidth: 300, maxHeight: 50)
                    .foregroundColor(.white)
                    .padding()
            }
            .overlay(
                RoundedRectangle(cornerRadius: 5)
                    .stroke(Color.white, lineWidth: 2)
            )
            .background(Color.ui.red)
    }
}

struct ProfileInformationView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileInformationView()
            .previewLayout(.sizeThatFits)
    }
}
