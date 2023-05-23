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
    case eUbertBike
    
    var id: Int { return rawValue }
    
    var description: String {
        switch self {
        case .eUberX: return "eUber X"
        case .eUberPlus: return "eUber Plus"
        case .eUbertBike: return "eUber Bike"
        }
    }
    
    var imageName: String {
        switch self {
        case .eUberX: return "hatchback"
        case .eUberPlus: return "suv"
        case .eUbertBike: return "motorbike"
        }
    }
    
}
