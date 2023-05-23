//
//  LocationSearchViewModel.swift
//  eUberUI
//
//  Created by Lucas Hubert on 17/05/23.
//

import Foundation
import MapKit

class LocationSearchViewModel: NSObject, ObservableObject {
    
    @Published var resuls = [MKLocalSearchCompletion]()
    @Published var selectedEUberLocation: EUberLocation?
    @Published var pickupTime: String?
    @Published var dropOffTime: String?
    
    private let searchCompleter = MKLocalSearchCompleter()
    
    var queryFragment: String = "" {
        didSet {
            searchCompleter.queryFragment = queryFragment
        }
    }
    
    var userLocation: CLLocationCoordinate2D?
    
    override init() {
        super.init()
        searchCompleter.delegate = self
        searchCompleter.queryFragment = queryFragment
    }
    
    
    // MARK: - Helpers
    func selectLocation(_ localSearch: MKLocalSearchCompletion) {
        locationSearch(forLocalSearchCompletion: localSearch) { response, error in
            if let error = error {
                print("DEBUG: Location search error: \(error.localizedDescription)")
                return
            }
            guard let item = response?.mapItems.first else { return }
            let coordinate = item.placemark.coordinate
            self.selectedEUberLocation = EUberLocation(title: localSearch.title, coordinate: coordinate)
            
            print("DEBUG: Location coordinates \(coordinate)")
        }
    }
    
    func locationSearch(forLocalSearchCompletion localSearch: MKLocalSearchCompletion,
                        completion: @escaping MKLocalSearch.CompletionHandler) {
        let searchRequest = MKLocalSearch.Request()
        searchRequest.naturalLanguageQuery = localSearch.title.appending(localSearch.subtitle)
        let search = MKLocalSearch(request: searchRequest)
        search.start(completionHandler: completion)
    }
    
    func computeRidePrice(forType type: RideType) -> Double {
        guard let destCoordinate = selectedEUberLocation?.coordinate else { return 0.0 }
        guard let userCoordinate = self.userLocation else { return 0.0 }
        
        let userLocation = CLLocation(
            latitude: userCoordinate.latitude,
            longitude: userCoordinate.longitude
        )
        
        let destination = CLLocation(
            latitude: destCoordinate.latitude,
            longitude: destCoordinate.longitude
        )
        
        let tripDistanceInMeters = userLocation.distance(from: destination)
        return type.computePrice(for: tripDistanceInMeters)
    }
    
    func getDestinationRoute(
        from userLocation: CLLocationCoordinate2D,
        to destination: CLLocationCoordinate2D,
        completion: @escaping(MKRoute) -> Void
    ) {
        let userPlacemark = MKPlacemark(coordinate: userLocation)
        let userDestination = MKPlacemark(coordinate: destination)
        let request = MKDirections.Request()
        request.source = MKMapItem(placemark: userPlacemark)
        request.destination = MKMapItem(placemark: userDestination)
        let direction = MKDirections(request: request)
        
        direction.calculate { response, error in
            if let error = error {
                print("DEBUG: Failed to get direction with error \(error.localizedDescription)")
            }
            
            guard let route = response?.routes.first else { return }
            self.configurePickupAndDropOffTimes(with: route.expectedTravelTime)
            completion(route)
        }
    }
    
    func configurePickupAndDropOffTimes(with expectedTravelTime: Double) {
        let formatter = DateFormatter()
        formatter.dateFormat = "hh:mm a"
        
        pickupTime = formatter.string(from: Date())
        dropOffTime = formatter.string(from: Date() + expectedTravelTime)
    }
    
}

// MARK: - MKLocalSearchCompleterDelegate

extension LocationSearchViewModel: MKLocalSearchCompleterDelegate {
    func completerDidUpdateResults(_ completer: MKLocalSearchCompleter) {
        self.resuls = completer.results
    }
}
