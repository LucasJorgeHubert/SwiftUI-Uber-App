//
//  LocationSearchResultCell.swift
//  eUberUI
//
//  Created by Lucas Hubert on 17/05/23.
//

import SwiftUI

struct LocationSearchResultCell: View {
    let title: String
    let subtitle: String
    
    var body: some View {
        HStack {
            Image(systemName: "mappin.circle.fill")
                .resizable()
                .foregroundColor(.yellow)
                .accentColor(Color(.systemYellow))
                .frame(width: 40, height: 40)
            
            VStack(alignment: .leading) {
                Text(title)
                    .font(.body)
                
                Text(subtitle)
                    .font(.system(size: 15))
                    .foregroundColor(.gray)
                
                Divider()
            }
            .padding(.leading, 8)
            .padding(.vertical, 8)
        }
        .padding(.leading)
    }
}

struct LocationSearchResultCell_Previews: PreviewProvider {
    static var previews: some View {
        LocationSearchResultCell(title: "Starbucks", subtitle: "123 Main ST, Cupertino CA")
    }
}
