//
//  ContentView.swift
//  RoninEMS
//
//  Created by Alvin Raygon on 6/16/21.
//

import SwiftUI

struct HomeView: View {
    @EnvironmentObject var accountVM: AccountViewModel
    var body: some View {
        TabView {
            Dashboard()
                .tabItem {
                    Image(systemName: "house")
                    Text("Home")
                }
            ProfileView()
                .tabItem {
                    Image(systemName: "person.crop.circle")
                    Text("Profile")
                }
                .environmentObject(accountVM)
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView().environmentObject(AccountViewModel())
            .environment(\.colorScheme, .dark)
    }
}
