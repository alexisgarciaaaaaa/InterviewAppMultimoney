//
//  MultimoneyTabBar.swift
//  InterviewAppMultimoney
//
//  Created by bryangarcia on 19/2/25.
//

import SwiftUI

struct MultimoneyTabBar: View {
    var body: some View {
        TabView {
            
            RocketsScreen()
                .tabItem {
                    K.Images.shipTabBarImage
                    Text(K.Strings.shipTabBar)
                }
            
            LauchesScreen()
                .tabItem {
                    K.Images.launchTabBarImage
                    Text(K.Strings.lauchesTabBar)
                }
        }
        .accentColor(.cyan)
    }
}

#Preview {
    MultimoneyTabBar()
}
