//
//  SweaterShopAppApp.swift
//  SweaterShopApp
//
//  Created by Fortesa Cena on 23.2.24.
//


import SwiftUI

@main
struct SweaterShopAppApp: App {
    let persistenceController = PersistenceController.shared


    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}

