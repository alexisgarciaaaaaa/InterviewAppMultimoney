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
            RoundedRectangle(cornerRadius: K.Constants.fifteen)
                .fill(LinearGradient(gradient: Gradient(colors: (launch?.launch_success ?? false) ? [Color.green, Color.blue] : [Color.red, Color.orange]),
                                     startPoint: .leading,
                                     endPoint: .trailing))
                .frame(height: K.Constants.oneHundred)
                .shadow(radius: K.Constants.three)

            HStack {
                VStack(alignment: .leading, spacing: K.Constants.five) {
                    Text(K.Strings.mission)
                        .font(.caption)
                        .foregroundColor(.white.opacity(0.8))

                    Text(launch?.mission_name ?? "")
                        .font(.title2).bold()
                        .foregroundColor(.white)

                    HStack {
                        Text((launch?.launch_success ?? false) ? K.Strings.successful : K.Strings.failed)
                            .font(.caption).bold()
                            .padding(.horizontal, K.Constants.ten)
                            .padding(.vertical, K.Constants.five)
                            .background(RoundedRectangle(cornerRadius: K.Constants.eigth).fill(.white.opacity(0.2)))
                            .foregroundColor(.white)
                    }
                }
                .padding(.leading, K.Constants.twenty)

                Spacer()
                
                K.Images.lauchImage
                        .resizable()
                        .scaledToFit()
                        .frame(width: K.Constants.fifty, height: K.Constants.fifty)
                        .padding()
                        .foregroundColor(.white.opacity(0.8))
            }
            .padding(.trailing, K.Constants.twenty)
        }
        .padding(.horizontal)
    }
}
