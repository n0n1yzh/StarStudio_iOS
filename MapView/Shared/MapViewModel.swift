//
//  MapViewModel.swift
//  MapView (iOS)
//
//  Created by 雨中寒 on 2021/2/26.
//

import SwiftUI
import MapKit
import CoreLocation

class MapViewModel: NSObject, ObservableObject, CLLocationManagerDelegate {
    @Published var mapView = MKMapView()
    @Published var region: MKCoordinateRegion!
    
    // Alert...
    @Published var permissionDenied = false
    
    // Map Type...
    @Published var mapType: MKMapType = .standard
    
    // SearchText...
    @Published var searchTxt = ""
    
    // Searched Places...
    @Published var places: [Place] = []
    
    // Updating Map Type...
    func updateMapType() {
        
        if mapType == .standard {
            mapType = .hybrid
            mapView.mapType = mapType
        }
        else {
            mapType = .standard
            mapView.mapType = mapType
        }
    }
    
    // Focus Location...
    func focusLocation() {
        
        guard let _ = region else {
            return
        }
        
        mapView.setRegion(region, animated: true)
        mapView.setVisibleMapRect(mapView.visibleMapRect, animated: true)
    }
    
    // Search Places...
    func searchQuery() {
        
        places.removeAll()
        
        let request = MKLocalSearch.Request()
        request.naturalLanguageQuery = searchTxt
        
        // Fetch...
        MKLocalSearch(request: request).start { (response, _) in
            
            guard let result = response else {
                return
            }
            
            self.places = result.mapItems.compactMap({ (item) -> Place? in
                return Place(place: item.placemark)
            })
            
        }
    }
    
    // Pick Search Result...
    func selectPlace(place: Place) {
        
        // Showing Pin On Map...
        searchTxt = ""
        
        guard let coordinate = place.place.location?.coordinate else {
            return
        }
        
        let poinAnnotation = MKPointAnnotation()
        poinAnnotation.coordinate = coordinate
        poinAnnotation.title = place.place.name ?? "No Name"
        
        // Removing All Old Ones...
        mapView.removeAnnotations(mapView.annotations)
        
        mapView.addAnnotation(poinAnnotation)
        
        // Moving Map To Location...
        let coordinateRegion = MKCoordinateRegion(center: coordinate, latitudinalMeters: 10000, longitudinalMeters: 10000)
        
        mapView.setRegion(coordinateRegion, animated: true)
        mapView.setVisibleMapRect(mapView.visibleMapRect, animated: true)
    }
    
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        // checking Permissions
        
        switch manager.authorizationStatus {
        case .denied:
            // Alert..
            permissionDenied.toggle()
        case .notDetermined:
            //Requesting
            manager.requestWhenInUseAuthorization()
        case .authorizedWhenInUse:
            // If Permisson Given...
            manager.requestLocation()
        default:
            ()
            
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        
        // Error...
        print(error.localizedDescription)
    }
    
    // Getting user Region...
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        guard let location = locations.last else {
            return
        }
        
        self.region = MKCoordinateRegion(center: location.coordinate, latitudinalMeters: 10000, longitudinalMeters: 10000)
        
        // Updating Map...
        self.mapView.setRegion(self.region, animated: true)
        
        // Smooth Animations...
        self.mapView.setVisibleMapRect(self.mapView.visibleMapRect, animated: true)
        
        
    }
}
