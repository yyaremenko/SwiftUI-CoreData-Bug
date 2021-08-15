//
//  ContentView.swift
//  SwiftUICoreDataBug
//
//  Created by Joe on 13.08.2021.
//

import SwiftUI
import CoreData

struct ContentView: View {
    @Environment(\.managedObjectContext) private var viewContext

    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \Item.title, ascending: true)],
        animation: .default)
    private var items: FetchedResults<Item>
    
    @State private var isSheetShown: Bool = true

    var body: some View {
        VStack {
            List {
                // looks like when a new Item is created in a child view,
                // the @FetchRequest, gets triggered (?), although the Item was never inserted,
                // and so, this causes the recreation of such child views, which,
                // in turn, creates a new Item, so the cycle repeats itself endlessly,
                // ending up in an endless recursion;
                // IF YOU COMMENT OUT THIS ForEach() View,
                // the recursion will not be triggered anymore
                ForEach(items) { anItem in
                    Text("\(anItem.title)")
                }
            }
            ChildView(viewContext: self.viewContext)
        }
    }
}
