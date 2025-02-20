//
//  LauchesViewModel.swift
//  InterviewAppMultimoney
//
//  Created by bryangarcia on 19/2/25.
//

import SwiftUI
import Apollo
import InterviewAppMultimoneyAPI

class LauchesViewModel: BaseViewModel {
    @Published var lauches: [GetLaunchesListQuery.Data.LaunchesPast?]? = []

    override init(service: ServicesProtocol) {
        super.init(service: service)
        getLanchesList()
    }

    func getLanchesList() {
        startLoading()

        service.networkClient.fetch(query: GetLaunchesListQuery(offset: .init(integerLiteral: currentPage), limit: perPage), queue: .main) { result in
            DispatchQueue.main.async {
                switch result {
                case .success(let response):
                    if let data = response.data?.launchesPast {
                        if self.currentPage == 1 {
                            self.lauches = data
                        } else {
                            self.lauches?.append(contentsOf: data)
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
