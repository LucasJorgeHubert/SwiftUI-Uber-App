//
//  LocationSearchActivationView.swift
//  eUberUI
//
//  Created by Lucas Hubert on 17/05/23.
//

import SwiftUI

struct LocationSearchActivationView: View {
    var body: some View {
        HStack {
            Rectangle()
                .fill(Color(.systemYellow))
                .frame(width: 8, height: 8)
                .padding(.horizontal)
            
            Text("Where to?")
                .foregroundColor(Color(.darkGray))
            
            Spacer()
        }
        .frame(width: UIScreen.main.bounds.width - 64, height: 50)
        .background(
            Rectangle()
                .fill(Color.white)
                .shadow(color: Color(.systemYellow), radius: 6)
        )
    }
}

struct LocationSearchActivationView_Previews: PreviewProvider {
    static var previews: some View {
        LocationSearchActivationView()
    }
}
