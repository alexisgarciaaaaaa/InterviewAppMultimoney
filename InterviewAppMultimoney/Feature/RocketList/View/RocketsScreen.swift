//
//  RocketsScreen.swift
//  InterviewAppMultimoney
//
//  Created by bryangarcia on 19/2/25.
//

import SwiftUI
import InterviewAppMultimoneyAPI


struct RocketsScreen: View {
    @StateObject var shipsViewModel: ShipViewModel
    
    init(shipsViewModel: ShipViewModel = ShipViewModel(service: DataService())) {
        _shipsViewModel = StateObject(wrappedValue: shipsViewModel)
    }
    var body: some View {
        NavigationView {
            RocketsCardsUI(
                cardViewBuilder: { ship in
                    ShipCardGradiant(ships: ship)
                },
                ships: $shipsViewModel.ships,
                firstLoading: $shipsViewModel.firstLoading,
                infinityLoading: $shipsViewModel.infinityLoading,
                onLastItemAppear: {
                    shipsViewModel.currentPage += 1
                    shipsViewModel.getShipsList()
                })
            .navigationTitle("Rockets")
        }
    }
}

#Preview {
    RocketsScreen(shipsViewModel: ShipViewModel(service: DataService()))
}
