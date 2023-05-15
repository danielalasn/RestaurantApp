//
//  Locations.swift
//  RestaurantsSU
//
//  Created by Daniel Alas on 12/5/23.
//

import Foundation
import SwiftUI
import MapKit

struct locations: View {
    let restaurant: String
    
    var latitudeN: Double {
        switch restaurant {
        case "La Chaya Maya":
            return 20.97
        case "Kuuk":
            return 20.989750517161788
        case "La Pigua":
            return 20.989
        case "Oliva Enoteca":
            return 20.974596902762265
        case "Habaneros":
            return 21.03206484985342
        case "Bistro Cultural":
            return 20.97116421799554
        case "Sonora Grill":
            return 21.02
        default:
            return 0.0
        }
    }
    
    var longitudeN: Double {
        switch restaurant {
        case "La Chaya Maya":
            return -89.624
        case "Kuuk":
            return -89.61610410438362
        case "La Pigua":
            return -89.6214
        case "Oliva Enoteca":
            return -89.61728763560156
        case "Habaneros":
            return -89.63181928850089
        case "Bistro Cultural":
            return -89.62952224239993
        case "Sonora Grill":
            return -89.5958139232912
        default:
            return 0.0
        }
    }
    
    @State private var region = MKCoordinateRegion()
    
    var body: some View {
        Map(coordinateRegion: $region, annotationItems: [AnnotationItem(coordinate: CLLocationCoordinate2D(latitude: latitudeN, longitude: longitudeN))]) { item in
            MapMarker(coordinate: item.coordinate)
        }
        .onAppear {
            setRegion()
        }
    }
    
    private func setRegion() {
        region = MKCoordinateRegion(
            center: CLLocationCoordinate2D(latitude: latitudeN, longitude: longitudeN),
            span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01)
        )
    }
}

struct AnnotationItem: Identifiable {
    let id = UUID()
    let coordinate: CLLocationCoordinate2D
}

