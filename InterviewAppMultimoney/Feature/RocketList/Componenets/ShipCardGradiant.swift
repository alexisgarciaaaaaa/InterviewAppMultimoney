//
//  ShipCardGradiant.swift
//  InterviewAppMultimoney
//
//  Created by bryangarcia on 19/2/25.
//

import SwiftUI

struct ShipCardGradiant: ShipCardDisplayable {
    var ships: ShipResponse

    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: K.Constants.fifteen)
                .fill(
                    LinearGradient(
                        gradient: Gradient(colors: [Color.gray, Color.gray.opacity(0.3)]),
                        startPoint: .topLeading,
                        endPoint: .bottomTrailing
                    )
                )
                .shadow(radius: K.Constants.three)

            VStack(spacing: 0) {
                AsyncImage(url: URL(string: ships.imageURL)) { image in
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(
                            width: UIScreen.main.bounds.width * 0.85,
                            height: K.Constants.oneHundredSeventy)
                        .clipped()
                        .clipShape(RoundedRectangle(
                            cornerRadius: K.Constants.fifteen,
                            style: .continuous))
                } placeholder: {
                    ProgressView()
                        .frame(height: K.Constants.oneHundredEigthy)
                }

                Spacer()
                HStack(alignment: .center, spacing: K.Constants.eigth) {
                    ShipInfoRow(label: K.Strings.name, value: ships.name)
                    Spacer()
                    ShipInfoRow(label: K.Strings.type, value: ships.type)
                    Spacer()
                    ShipInfoRow(label: K.Strings.year, value: "\(ships.year)")
                }
                .padding(.horizontal, K.Constants.twenty)
                .padding(.vertical, K.Constants.fifteen)
            }
        }
        .frame(minHeight: K.Constants.twoHundredEigthy)
        .padding(.horizontal)
    }
}
