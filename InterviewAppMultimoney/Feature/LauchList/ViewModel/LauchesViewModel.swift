//
//  LauchesViewModel.swift
//  InterviewAppMultimoney
//
//  Created by bryangarcia on 19/2/25.
//

import SwiftUI
import Apollo
import InterviewAppMultimoneyAPI

class LauchesViewModel: ObservableObject {
    @Published var lauches: [GetLaunchesListQuery.Data.LaunchesPast?]? = []
    @Published var firstLoading: Bool = false
    @Published var infinityLoading: Bool = false
    @Published var currentPage: Int = 1
    @Published var perPage: GraphQLNullable<Int> = 10
    let service: ServicesProtocol
    
    init(service: ServicesProtocol) {
        self.service = service
        self.getLanchesList()
    }
    
    func getLanchesList() {
        
        if currentPage == 1 {
            firstLoading = true
        } else {
            infinityLoading = true
        }
        service.networkClient.fetch(query: GetLaunchesListQuery(offset: .init(integerLiteral: currentPage), limit: perPage), queue: .main) { result in
            switch result {
            case .success(let lauches):
                if let data = lauches.data?.launchesPast {
                    if self.currentPage == 1 {
                        self.lauches = data
                        self.firstLoading = false
                        self.infinityLoading = false
                    } else {
                        self.lauches?.append(contentsOf: data)
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
