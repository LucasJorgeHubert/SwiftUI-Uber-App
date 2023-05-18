//
//  eUberUIApp.swift
//  eUberUI
//
//  Created by Lucas Hubert on 17/05/23.
//

import SwiftUI

@main
struct eUberUIApp: App {
    @StateObject var locationViewModel = LocationSearchViewModel()

    var body: some Scene {
        WindowGroup {
            HomeView()
                .environmentObject(locationViewModel)
        }
    }
}
