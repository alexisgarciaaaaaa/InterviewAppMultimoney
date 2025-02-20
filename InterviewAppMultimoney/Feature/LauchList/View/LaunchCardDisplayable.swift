//
//  LaunchCardDisplayable.swift
//  InterviewAppMultimoney
//
//  Created by bryangarcia on 19/2/25.
//

import SwiftUI
import InterviewAppMultimoneyAPI

protocol LaunchCardDisplayable: View {
    var launch: GetLaunchesListQuery.Data.LaunchesPast? { get }
}
