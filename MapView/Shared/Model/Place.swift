//
//  Place.swift
//  MapView (iOS)
//
//  Created by 雨中寒 on 2021/2/27.
//

import SwiftUI
import MapKit

struct Place: Identifiable {
    
    var id = UUID().uuidString
    var place: CLPlacemark
    
}
