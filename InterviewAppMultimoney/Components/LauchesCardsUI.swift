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
            LazyVStack(spacing: K.Constants.sixteen) {
                if !firstLoading {
                    if let launches = lauches {
                        ForEach(launches, id: \.?.id) { data in
                            cardViewBuilder(data)
                                .padding(.horizontal)
                                .onAppear {
                                    if lauches?.last == data { 
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
            .padding(.top, K.Constants.sixteen)
        }
        .background(Color(.systemGroupedBackground))
    }
}
#Preview {
    LauchesScreen()
}
