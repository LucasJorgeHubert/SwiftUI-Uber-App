//
//  MarvelUIApp.swift
//  MarvelUI
//
//  Created by Lucas Hubert on 17/05/23.
//

import SwiftUI

@main
struct MarvelUIApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            HomeView()
        }
    }
}
