//
//  NotSheet.swift
//  SwiftUICoreDataBug
//
//  Created by Joe on 15.08.2021.
//

import SwiftUI
import CoreData

struct ChildView: View {
    
    // I don't pass viewContext via env here, because I need init()
    // to e.g. initiate a ViewModel
    init(viewContext: NSManagedObjectContext) {
        print("init: CHILD")
        // this triggers endless recursion; pay attention
        // that the Item is never saved, just created,
        // so this should not trigger parent's view @FetchRequest,
        // but it does (?)
        let _ = Item(context: viewContext)
    }
    
    var body: some View {
        Text("Lorem ipsum and stuff")
    }
}

struct ChildView_Previews: PreviewProvider {
    static var previews: some View {
        ChildView(
            viewContext: PersistenceController.shared.container.viewContext        )
    }
}
