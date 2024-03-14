//
//  QuizzView.swift
//  BibleFlashCard
//
//  Created by Elie BINGUE on 13/03/2024.
//

import SwiftUI

struct QuizzView: View {
    @State var backDegree = 90.0
    @State var frontDegree = 0.0
    @State var isFlipped = false
    let durationAndDelay: CGFloat = 0.1

    @State var questionNum = 0

    @Environment(\.managedObjectContext) private var viewContext

    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \Item.question, ascending: true)],
        animation:.default)
    private var items: FetchedResults<Item>

    var body: some View {
        VStack {
            ZStack {
                CardFront(degree: $frontDegree, textContent: items[questionNum].question!)
                CardBack(degree: $backDegree, textContent: items[questionNum].answer!)
            }.onTapGesture {
                flipCard()
            }
            HStack {
                if questionNum > 0 {
                    Button(action: {
                        if !isFlipped {
                            flipCard()
                        }
                        questionNum -= 1
                    }) {
                        Text("< Previous")
                    }.frame(maxWidth:.infinity)
                } else {
                    Text("< Previous")
                        .frame(maxWidth:.infinity)
                        .foregroundColor(.secondary)
                }
                // Card Numbers
                Text("Card \(questionNum + 1) of \(items.count)")

                if questionNum < (items.count - 1) {
                    Button(action: {
                        if !isFlipped {
                            flipCard()
                        }
                        questionNum += 1
                    }) {
                        Text("Next >")
                    }.frame(maxWidth:.infinity)
                } else {
                    Text("Next >")
                        .frame(maxWidth:.infinity)
                        .foregroundColor(.secondary)
                }
            }.padding()
        }
    }

    func flipCard() {
        isFlipped.toggle()

        if isFlipped {
            withAnimation(.linear(duration: durationAndDelay)) {
                backDegree = 90
            }
            withAnimation(.linear(duration: durationAndDelay)) {
                frontDegree = 0
            }
        } else {
            withAnimation(.linear(duration: durationAndDelay)) {
                frontDegree = -90
            }
            withAnimation(.linear(duration: durationAndDelay)) {
                backDegree = 0
            }
        }
    }
}


#Preview {
    QuizzView()
    .environment(\.managedObjectContext,
                  PersistenceController.preview.container.viewContext)
}
