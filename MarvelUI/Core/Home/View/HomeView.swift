//
//  HomeView.swift
//  MarvelUI
//
//  Created by Lucas Hubert on 17/05/23.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        ZStack(alignment: .top) {
            UberMapViewRepresentable()
                .ignoresSafeArea()
            
            LocationSearchActivationView()
                .padding(.vertical, 72)
            
            MapViewActionButton()
                .padding(.leading)
                .padding(.top, 4)
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
