//
//  LauchesScreen.swift
//  InterviewAppMultimoney
//
//  Created by bryangarcia on 19/2/25.
//

import SwiftUI
import InterviewAppMultimoneyAPI

struct LauchesScreen: View {
    @StateObject var launchesViewModel = LauchesViewModel()
    var body: some View {
        NavigationView {
            LauchesCardsUI(
                cardViewBuilder: { launches in
                    LaunchCardGradiant(launch: launches)
                }, lauches: launchesViewModel.lauches,
                firstLoading: $launchesViewModel.firstLoading, 
                infinityLoading: $launchesViewModel.infinityLoading,
                onLastItemAppear: {
                    launchesViewModel.currentPage += 1
                    launchesViewModel.getLanchesList()
                })
            .navigationTitle("Launches")
        }
    }
}

#Preview {
    LauchesScreen()
}
