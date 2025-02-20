//
//  LaunchCardGradiant.swift
//  InterviewAppMultimoney
//
//  Created by bryangarcia on 19/2/25.
//

import SwiftUI
import InterviewAppMultimoneyAPI

struct LaunchCardGradiant: LaunchCardDisplayable {
    var launch: GetLaunchesListQuery.Data.LaunchesPast?

    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 15)
                .fill(LinearGradient(gradient: Gradient(colors: (launch?.launch_success ?? false) ? [Color.green, Color.blue] : [Color.red, Color.orange]),
                                     startPoint: .leading,
                                     endPoint: .trailing))
                .frame(height: 100)
                .shadow(radius: 3)

            HStack {
                VStack(alignment: .leading, spacing: 5) {
                    Text("Mission:")
                        .font(.caption)
                        .foregroundColor(.white.opacity(0.8))

                    Text(launch?.mission_name ?? "")
                        .font(.title2).bold()
                        .foregroundColor(.white)

                    HStack {
                        Text((launch?.launch_success ?? false) ? "Successful" : "Failed")
                            .font(.caption).bold()
                            .padding(.horizontal, 10)
                            .padding(.vertical, 5)
                            .background(RoundedRectangle(cornerRadius: 8).fill(.white.opacity(0.2)))
                            .foregroundColor(.white)
                    }
                }
                .padding(.leading, 20)

                Spacer()
                
                    Image(systemName: "rocket.fill")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 50, height: 50)
                        .padding()
                        .foregroundColor(.white.opacity(0.8))
//                }
            }
            .padding(.trailing, 20)
        }
        .padding(.horizontal)
    }
}
