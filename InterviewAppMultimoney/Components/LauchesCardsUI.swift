//
//  LauchesCardsUI.swift
//  InterviewAppMultimoney
//
//  Created by bryangarcia on 19/2/25.
//

import SwiftUI
import InterviewAppMultimoneyAPI

struct LauchesCardsUI<CardView: LaunchCardDisplayable>: View {
    let cardViewBuilder: (GetLaunchesListQuery.Data.LaunchesPast?) -> CardView
    var lauches: [GetLaunchesListQuery.Data.LaunchesPast?]?
    @Binding var firstLoading: Bool
    @Binding var infinityLoading: Bool
    var onLastItemAppear: (() -> Void)?

    var body: some View {
        ScrollView {
            LazyVStack(spacing: 16) {
                if !firstLoading {
                    if let launches = lauches {
                        ForEach(launches.indices, id: \.self) { index in
                            let launch = launches[index]
                            cardViewBuilder(launch)
                                .padding(.horizontal)
                                .onAppear {
                                    if index == launches.count - 1 { 
                                        onLastItemAppear?()
                                    }
                                }
                        }
                        
                        if infinityLoading {
                            ProgressView()
                                .progressViewStyle(.circular)
                                .padding()
                        }
                    }
                } else {
                    ProgressView()
                        .progressViewStyle(.circular)
                        .padding()
                }
            }
            .padding(.top, 16)
        }
        .background(Color(.systemGroupedBackground))
    }
}
#Preview {
    LauchesScreen()
}
