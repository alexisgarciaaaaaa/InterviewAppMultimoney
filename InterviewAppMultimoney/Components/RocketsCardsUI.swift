//
//  RocketsCardsUI.swift
//  InterviewAppMultimoney
//
//  Created by bryangarcia on 19/2/25.
//

import SwiftUI
import InterviewAppMultimoneyAPI

struct RocketsCardsUI<CardView: ShipCardDisplayable>: View {
    let cardViewBuilder: (ShipResponse) -> CardView
    @Binding var ships: [ShipResponse]
    @Binding var firstLoading: Bool
    @Binding var infinityLoading: Bool
    var onLastItemAppear: (() -> Void)?

    var body: some View {
        ScrollView {
            LazyVStack(spacing: 16) {
                if !firstLoading {
                        ForEach(ships , id: \.id) { data in
                            cardViewBuilder(data)
                                .padding(.horizontal)
                                .onAppear {
                                    if ships.last == data {
                                        onLastItemAppear?()
                                    }
                                }
                        }
                        
                        if infinityLoading {
                            ProgressView()
                                .progressViewStyle(.circular)
                                .padding()
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

