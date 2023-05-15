//
//  RestaurantsSUApp.swift
//  RestaurantsSU
//
//  Created by Daniel Alas on 12/5/23.
//

import SwiftUI
import Firebase

@main
struct RestaurantsSUApp: App {
    init(){
        FirebaseApp.configure()
    }
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
