//
//  RideType.swift
//  eUberUI
//
//  Created by Lucas Hubert on 22/05/23.
//

import Foundation

enum RideType: Int, CaseIterable, Identifiable {
    case eUberX
    case eUberPlus
    case eUberBike
    
    var id: Int { return rawValue }
    
    var description: String {
        switch self {
        case .eUberX: return "eUber X"
        case .eUberPlus: return "eUber Plus"
        case .eUberBike: return "eUber Bike"
        }
    }
    
    var imageName: String {
        switch self {
        case .eUberX: return "hatchback"
        case .eUberPlus: return "suv"
        case .eUberBike: return "motorbike"
        }
    }
    
    var baseFare: Double {
        switch self {
        case .eUberBike: return 5
        case .eUberPlus: return 20
        case .eUberX: return 10
        }
    }
    
    func computePrice(for distanceInMeters: Double) -> Double {
        let distanceInMiles = distanceInMeters / 1600
        switch self {
        case .eUberBike: return distanceInMiles * 1.5 + baseFare
        case .eUberX: return distanceInMiles * 2.0 + baseFare
        case .eUberPlus: return distanceInMiles * 2.3 + baseFare
        }
    }
}
