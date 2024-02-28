//
//  OrderDetailsView.swift
//  SweaterShopApp
//
//  Created by Fortesa Cena on 26.2.24.
//

import Foundation
import SwiftUI

struct OrderDetailsView: View {
    @FetchRequest(
        entity: Order.entity(),
        sortDescriptors: [NSSortDescriptor(keyPath: \Order.date, ascending: true)]
    ) var orders: FetchedResults<Order>

    var body: some View {
        List(orders, id: \.self) { order in
            VStack(alignment: .leading) {
                let itemText = "Items: \(String(describing: order.items))"
                Text(itemText)
                Text("Total: \(order.total, specifier: "%.2f")")
                Text("Date: \( itemFormatter.string (from: order.date ?? Date()))")
            }
        }
    }
}

private let itemFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateStyle = .short
    formatter.timeStyle = .short
    return formatter
}()
