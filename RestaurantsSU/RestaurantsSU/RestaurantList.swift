//
//  RestaurantList.swift
//  RestaurantsSU
//
//  Created by Daniel Alas on 12/5/23.
//

import Foundation
import SwiftUI

struct RestaurantList: View {
    @Binding var userIsLoggedIn: Bool
    @Environment(\.presentationMode) var presentationMode

    let restaurants = restaurantList
    var body: some View {
        NavigationView {
            List {
                ForEach(restaurants, id: \.self) { restaurant in
                    NavigationLink(destination: restaurantsDetailView(restaurant: restaurant)){
                        Text(restaurant)
                    }.padding()
                }
                .navigationTitle("Restaurants:")
            }
        }
        
        Button {
            UserDefaults.standard.removeObject(forKey: "UserIsLoggedIn")
            userIsLoggedIn = false
            presentationMode.wrappedValue.dismiss()
        }label: {
            Text("Log Out")
                .bold()
                .frame(width: 200, height: 40)
                .background(Color.blue.opacity(0.75))
                .foregroundColor(.white)
                .cornerRadius(25)
        }
    }
}

//struct RestaurantList_Previews: PreviewProvider{
//    static var previews : some View {
//        RestaurantList()
//    }
//}
