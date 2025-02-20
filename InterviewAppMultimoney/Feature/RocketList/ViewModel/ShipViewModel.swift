//
//  RocketViewModel.swift
//  InterviewAppMultimoney
//
//  Created by bryangarcia on 19/2/25.
//

import SwiftUI
import Apollo
import InterviewAppMultimoneyAPI
import Combine

class ShipViewModel: BaseViewModel {
    
    @Published var ships: [ShipResponse] = []
    
    override init(service: ServicesProtocol) {
        super.init(service: service)
        getShipsList()
    }
    
    func getShipsList() {
        startLoading()
        
        service.networkClient.fetch(query: GetShipListQuery(limit: .init(integerLiteral: currentPage), offset: perPage), queue: .main) { result in
            DispatchQueue.main.async {
                switch result {
                case .success(let response):
                    if let data = response.data?.ships {
                        let newData = data.compactMap { info in
                            return ShipResponse(
                                year: info?.year_built ?? 0,
                                type: info?.type ?? "",
                                name: info?.name ?? "",
                                imageURL: info?.image ?? ""
                            )
                        }
                        if self.currentPage == 1 {
                            self.ships = newData
                        } else {
                            self.ships.append(contentsOf: newData)
                        }
                    }
                case .failure(let error):
                    print("Error: \(error)")
                }
                self.stopLoading()
            }
        }
    }
}
