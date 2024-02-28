//
//  Order.swift
//  SweaterShopApp
//
//  Created by Fortesa Cena on 26.2.24.
//

import Foundation

struct order: Identifiable, Codable {
    var id: UUID = UUID()
    var items: String // Assuming an order contains a list of item names
    var total: Double // Total cost of the order
    var date: Date // Order date
}
