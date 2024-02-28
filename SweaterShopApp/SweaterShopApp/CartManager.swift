//
//  CartManager.swift
//  SweaterShopApp
//
//  Created by Fortesa Cena on 27.2.24.
//

import Foundation
import CoreData

class CartManager: ObservableObject {
    @Published private(set) var products: [Product] = []
    @Published private(set) var total: Int = 0
    
    
    var context: NSManagedObjectContext
    
    init(context: NSManagedObjectContext = PersistenceController.shared.container.viewContext){self.context = context}
    
    // Payment-related variables
    let paymentHandler = PaymentHandler()
    @Published var paymentSuccess = false
    @Published var viewingOrders = false
    
    // Functions to add and remove from cart
    func addToCart(product: Product) {
        products.append(product)
        total += product.price
    }
    
    func removeFromCart(product: Product) {
        products = products.filter { $0.id != product.id }
        total -= product.price
    }
    
    // Call the startPayment function from the PaymentHandler. In the completion handler, set the paymentSuccess variable
    func pay() {
        paymentHandler.startPayment(products: products, total: total) { success in
            DispatchQueue.main.async {
                self.paymentSuccess = success
                if success {
                    // Create a new Order instance
                    let newOrder = Order(context: self.context)
                    newOrder.date = Date()
                    newOrder.total = Double(self.total)
                    // Convert the product names array to a single string separated by commas
                    newOrder.items = self.products.map { $0.name }.joined(separator: ", ")

                    // Save the context
                    do {
                        try self.context.save()
                        // Clear the products and total after saving the order
                        self.products = []
                        self.total = 0
                    } catch {
                        print("Failed to save the order: \(error)")
                    }
                }
            }
        }
    }
    
}

