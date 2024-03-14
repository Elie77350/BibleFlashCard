//
//  ContentView.swift
//  BibleFlashCard
//
//  Created by Elie BINGUE on 13/03/2024.
//

import SwiftUI
import CoreData

struct ContentView: View {
    var body: some View {
        TabView {
            QuestionListView()
                .tabItem {
                    Label("Question List",
                            systemImage:"list.dash")
            }
            QuizzView()
                .tabItem {
                    Label("Quizz",
                          systemImage:"questionmark")
                }

        }
    }
}

#Preview {
    ContentView()
}
