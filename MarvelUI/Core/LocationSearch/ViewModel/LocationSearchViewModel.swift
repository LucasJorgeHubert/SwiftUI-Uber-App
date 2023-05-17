//
//  LocationSearchViewModel.swift
//  MarvelUI
//
//  Created by Lucas Hubert on 17/05/23.
//

import Foundation
import MapKit

class LocationServiceViewModel: NSObject, ObservableObject {
    
    @Published var resuls = [MKLocalSearchCompletion]()
    private let searchCompleter = MKLocalSearchCompleter()
    var queryFragment: String = "" {
        didSet {
            searchCompleter.queryFragment = queryFragment
        }
    }
    
    override init() {
        super.init()
        searchCompleter.delegate = self
        searchCompleter.queryFragment = queryFragment
    }
}

// MARK: - MKLocalSearchCompleterDelegate

extension LocationServiceViewModel: MKLocalSearchCompleterDelegate {
    func completerDidUpdateResults(_ completer: MKLocalSearchCompleter) {
        self.resuls = completer.results
    }
}
