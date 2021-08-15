//
//  Item+CoreDataProperties.swift
//  SwiftUICoreDataBug
//
//  Created by Joe on 15.08.2021.
//
//

import Foundation
import CoreData


extension Item {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Item> {
        return NSFetchRequest<Item>(entityName: "Item")
    }

    @NSManaged public var timestamp: Date?
    @NSManaged public var title: String

}

extension Item : Identifiable {

}
