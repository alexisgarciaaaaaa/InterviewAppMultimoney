//
//  ShipResponse.swift
//  InterviewAppMultimoney
//
//  Created by bryangarcia on 19/2/25.
//

import SwiftUI

struct ShipResponse: Identifiable, Equatable {
    let id = UUID().uuidString
    let year: Int
    let type: String
    let name: String
    let imageURL: String
}
