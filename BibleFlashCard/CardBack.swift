//
//  CardBack.swift
//  BibleFlashCard
//
//  Created by Elie BINGUE on 14/03/2024.
//

import SwiftUI

struct CardBack: View {
    @Binding var degree: Double
    let textContent: String

    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 20)
                .stroke(.blue.opacity(0.5), lineWidth: 10)
                .padding()

            RoundedRectangle(cornerRadius: 20)
                .fill(.blue.opacity(0.1))
                .padding()

            VStack {
                Text("Answer:")
                    .font(Font.custom("Rainbow Paper", size: 50))
                    .padding()

                Text(textContent)
                    .lineLimit(10)
                    .font(Font.custom("Rainbow Paper", size: 40))
                    .multilineTextAlignment(.center)
                    .padding(25)
            }
        }
        .rotation3DEffect(Angle(degrees: degree), axis: (x: 0, y: 1, z: 0))
    }
}
