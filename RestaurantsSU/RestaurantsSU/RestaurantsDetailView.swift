//
//  RestaurantsDetailView.swift
//  RestaurantsSU
//
//  Created by Daniel Alas on 12/5/23.
//

import Foundation
import SwiftUI
struct restaurantsDetailView: View {
    let restaurant: String
    var body: some View {
        VStack {
            Image(restaurant)
                .resizable()
                .aspectRatio(contentMode: .fit)
            
            Text(restaurant)
                .font(.system(size: 40))
                .padding(.horizontal, 20)
            
            switch restaurant {
            case "La Chaya Maya":
                VStack {
                    Text("⭐⭐⭐⭐")
                    Text("📍 C. 57 x 62, Parque Santa Lucia, Centro, 97000 Mérida, Yuc., México")
                    Text("📞 529999284780")
                    Text("🕟 Todos los días 7:00-23:00")
                }
            case "Kuuk":
                Text("⭐⭐⭐⭐⭐")
                Text("📍 Av Rómulo Rozo 488, Itzimná, 97100 Mérida, Yuc., México")
                Text("📞 529999443377")
                Text("🕟Lunes cierra\n  Martes a sábado: 13:30-22:00\n  Domingo: 13:30-16:30")
            case "La Pigua":
                Text("⭐⭐⭐⭐")
                Text("📍 Av Cupules 505 A, Yucatán, 97050 Mérida, Yuc., México")
                Text("📞 529999203605")
                Text("🕟 Domingo a Martes: 12:00-18:00\n  Miércoles a sábado: 12:00-22:00")
            case "Oliva Enoteca":
                Text("⭐⭐⭐⭐")
                Text("📍 Calle 47 & Esquina con 54 S/N, Centro, 97000 Mérida, Yuc., México")
                Text("📞 529999233081")
                Text("🕟 Lunes a jueves: 13:00-23:00\n  Viernes y sábado: 13:00-24:00\n  Domingo: Cerrado")
            case "Habaneros":
                Text("⭐⭐⭐⭐⭐")
                Text("📍 Calle 20-A Num 302 X 5b Y 5c, Xcumpich, 97204 Mérida, Yuc., México")
                Text("📞 529991956157")
                Text("🕟 Todos los días 7:00-20:00")
            case "Bistro Cultural":
                Text("⭐⭐⭐")
                Text("📍 Calle 57 Entre Calle 72 y Calle 70, Centro, 97000 Mérida, Yuc., México")
                Text("📞 529992049358")
                Text("🕟 Lunes: Cerrado\n  Martes a sábado: 8:30-17:00\n  Domingo: 8:30-16:00")
            case "Sonora Grill":
                Text("⭐⭐⭐⭐")
                Text("📍 C. 37 215, Monterreal, 97133 Mérida, Yuc., México")
                Text("📞 529994819451")
                Text("🕟 Lunes y martes: 13:00 a 24:00\n  Miérciles: 13:00 a 1:00\n  Jueves a sábado: 13:00-2:00\n  Domingo: 13:00-22:00")
            default:
                Text("Error")
            }
            NavigationLink(destination: locations(restaurant: restaurant).navigationTitle("Location"), label: {Text("Location")
                    .padding()
                    .background(Color.gray)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            })
        }
        .padding(.horizontal, 20)
    }
}
