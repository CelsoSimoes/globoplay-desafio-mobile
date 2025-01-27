//
//  InitialPage.swift
//  DesafioGloboplayCelsos
//
//  Created by Celso Junio Simões de Oliveira Santos on 27/01/25.
//

import SwiftUI

struct InitialPage: View {
    var body: some View {
        TabView {
            HomeView()
                .tabItem {
                    Image("home")
                        .renderingMode(.template)
                    Text("Início")
                }
            
            MyListView()
                .tabItem {
                    Image("baseline_star_rate_black_18")
                        .renderingMode(.template)
                    Text("Minha Lista")
                }
        }
        .accentColor(.white)
        .onAppear {
            UITabBar.appearance().barStyle = .black
            UITabBar.appearance().barTintColor = UIColor.black
            UITabBar.appearance().unselectedItemTintColor = UIColor.gray
        }
    }
}

#Preview {
    InitialPage()
}
