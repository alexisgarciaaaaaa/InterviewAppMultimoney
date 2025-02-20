//
//  BaseViewModel.swift
//  InterviewAppMultimoney
//
//  Created by bryangarcia on 19/2/25.
//

import SwiftUI
import InterviewAppMultimoneyAPI

class BaseViewModel: ObservableObject {
    @Published var firstLoading: Bool = false
    @Published var infinityLoading: Bool = false
    @Published var currentPage: Int = 1
    @Published var perPage: GraphQLNullable<Int> = 10
    let service: ServicesProtocol

    init(service: ServicesProtocol) {
        self.service = service
    }

    func startLoading() {
        if currentPage == 1 {
            firstLoading = true
        } else {
            infinityLoading = true
        }
    }

    func stopLoading() {
        firstLoading = false
        infinityLoading = false
    }
}
