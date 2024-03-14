//
//  QuestionListView.swift
//  BibleFlashCard
//
//  Created by Elie BINGUE on 13/03/2024.
//

import SwiftUI

struct QuestionListView: View {
    @Environment(\.managedObjectContext) private var viewContext

    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \Item.question, ascending: true)],
        animation: .default)
    private var items: FetchedResults<Item>

    @State var showAddQuestionView = false

    var body: some View {
        NavigationView {
            List {
                ForEach(items) { item in
                    Text(item.question!)
                }
                .onDelete(perform: deleteItems)
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    EditButton()
                }
                ToolbarItem {
                    Button(action: {showAddQuestionView = true}) {
                        Label("Add Item", systemImage: "plus")
                    }
                }
            }
            .navigationTitle("Questions")
            .navigationViewStyle(StackNavigationViewStyle())
        }
        .sheet(isPresented: $showAddQuestionView, content: {
            AddQuestionView()
        })
    }

    
    private func deleteItems(offsets: IndexSet) {
        withAnimation {
            offsets.map { items[$0] }.forEach(viewContext.delete)

            do {
                try viewContext.save()
            } catch {
                    // Replace this implementation with code to handle the error appropriately.
                    // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
    }
  }
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }


#Preview {
    QuestionListView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
}
