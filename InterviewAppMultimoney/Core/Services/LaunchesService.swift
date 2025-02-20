//
//  LaunchesService.swift
//  InterviewAppMultimoney
//
//  Created by bryangarcia on 19/2/25.
//

import Foundation
import Apollo

class DataService: ServicesProtocol {
    var networkClient = ApolloClient(url: URL(string: "https://spacex-production.up.railway.app")!)
}
