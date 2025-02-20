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
            RoundedRectangle(cornerRadius: 15)
                .fill(
                    LinearGradient(
                        gradient: Gradient(colors: [Color.gray, Color.gray.opacity(0.3)]),
                        startPoint: .topLeading,
                        endPoint: .bottomTrailing
                    )
                )
                .shadow(radius: 3)

            VStack(spacing: 0) {
                AsyncImage(url: URL(string: ships.imageURL)) { image in
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: UIScreen.main.bounds.width * 0.85,height: 170)
                        .clipped()
                        .clipShape(RoundedRectangle(cornerRadius: 15, style: .continuous))
                } placeholder: {
                    ProgressView()
                        .frame(height: 180)
                }

                Spacer()
                HStack(alignment: .center, spacing: 8) {
                    ShipInfoRow(label: "Name:", value: ships.name)
                    Spacer()
                    ShipInfoRow(label: "Type:", value: ships.type)
                    Spacer()
                    ShipInfoRow(label: "Year:", value: "\(ships.year)")
                }
                .padding(.horizontal, 20)
                .padding(.vertical, 15)
            }
        }
        .frame(minHeight: 280)
        .padding(.horizontal)
    }
}
