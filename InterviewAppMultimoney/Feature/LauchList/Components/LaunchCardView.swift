//
//  LaunchCardView.swift
//  InterviewAppMultimoney
//
//  Created by bryangarcia on 19/2/25.
//

import SwiftUI
import InterviewAppMultimoneyAPI

struct LaunchCardView: LaunchCardDisplayable {
    let launch: GetLaunchesListQuery.Data.LaunchesPast?

    var body: some View {
        VStack(alignment: .leading, spacing: K.Constants.eigth) {
            HStack {
                Text(launch?.mission_name ?? "")
                    .font(.title2)
                    .bold()
                Spacer()
                Text(launch?.launch_year ?? "")
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }
            
            HStack {
                Text((launch?.launch_success ?? false) == true ? "✅ \(K.Strings.successful)" : "❌ \(K.Strings.failed)")
                    .font(.subheadline)
                    .foregroundColor((launch?.launch_success ?? false) == true ? .green : .red)
            }
            
            if (launch?.details ?? "").isEmpty {
                Text(launch?.details ?? "")
                    .font(.body)
                    .lineLimit(3)
                    .foregroundColor(.secondary)
            }
        }
        .padding()
        .background(RoundedRectangle(
            cornerRadius: 12).fill(Color(.systemBackground)).shadow(radius: K.Constants.four)
        )
        .padding(.horizontal)
    }
}

