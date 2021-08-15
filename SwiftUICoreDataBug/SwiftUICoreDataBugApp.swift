//
//  SwiftUICoreDataBugApp.swift
//  SwiftUICoreDataBug
//
//  Created by Joe on 13.08.2021.
//

import SwiftUI

@main
struct SwiftUICoreDataBugApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
