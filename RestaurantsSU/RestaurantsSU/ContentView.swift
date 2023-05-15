//
//  ContentView.swift
//  RestaurantsSU
//
//  Created by Daniel Alas on 12/5/23.
//

import SwiftUI

import SwiftUI

struct ContentView: View {
    
    let restaurants = restaurantList
    var body: some View {
        Login()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewDevice("iPhone 8")
    }
}
