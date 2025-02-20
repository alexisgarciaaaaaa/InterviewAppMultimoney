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
                    Image(systemName: "fireworks")
                    Text("Lanzamientos")
                }
            
            LauchesScreen()
                .tabItem {
                    Image(systemName: "flame.fill")
                    Text("Cohetes")
                }
        }
        .accentColor(.cyan)
    }
}

#Preview {
    MultimoneyTabBar()
}
