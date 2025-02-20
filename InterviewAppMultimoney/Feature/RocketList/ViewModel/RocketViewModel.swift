//
//  RocketViewModel.swift
//  InterviewAppMultimoney
//
//  Created by bryangarcia on 19/2/25.
//

import SwiftUI
import Apollo
import InterviewAppMultimoneyAPI

struct ShipResponse: Identifiable, Equatable {
    let id = UUID().uuidString
    let year: Int
    let type: String
    let name: String
    let imageURL: String
}

class ShipViewModel: ObservableObject {
    
    @Published var ships: [ShipResponse] = []
    @Published var firstLoading: Bool = false
    @Published var infinityLoading: Bool = false
    @Published var currentPage: Int = 1
    @Published var perPage: GraphQLNullable<Int> = 10
    let service: ServicesProtocol
    
    init(service: ServicesProtocol) {
        self.service = service
        self.getShipsList()
    }
    
    func getShipsList() {
        
        if currentPage == 1 {
            firstLoading = true
        } else {
            infinityLoading = true
        }
        service.networkClient.fetch(query: GetShipListQuery(limit: .init(integerLiteral: currentPage), offset: perPage), queue: .main) { result in
            switch result {
            case .success(let rockets):
                if let data = rockets.data?.ships {
                    if self.currentPage == 1 {
                        self.ships = data.compactMap { info in
                            return ShipResponse(
                                year: info?.year_built ?? 0,
                                type: info?.type ?? "",
                                name: info?.name ?? "",
                                imageURL: info?.image ?? "")
                        }
                        self.firstLoading = false
                        self.infinityLoading = false
                    } else {
                        let newData = data.compactMap { info in
                            return ShipResponse(
                                year: info?.year_built ?? 0,
                                type: info?.type ?? "",
                                name: info?.name ?? "",
                                imageURL: info?.image ?? "")
                        }
                        self.ships.append(contentsOf: newData)
                        self.firstLoading = false
                        self.infinityLoading = false
                    }
                    
                }
            case .failure(let error):
                self.firstLoading = false
                self.infinityLoading = false
                print("Error: \(error)")
            }
        }
    }
}
