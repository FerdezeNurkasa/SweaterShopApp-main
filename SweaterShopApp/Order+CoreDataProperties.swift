//
//  Order+CoreDataProperties.swift
//  SweaterShopApp
//
//  Created by Fortesa Cena on 27.2.24.
//
//

import Foundation
import CoreData


extension Order {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Order> {
        return NSFetchRequest<Order>(entityName: "order")
    }

    @NSManaged public var id: UUID?
    @NSManaged public var items: String?
    @NSManaged public var total: Double
    @NSManaged public var date: Date?

}

extension Order : Identifiable {

}
