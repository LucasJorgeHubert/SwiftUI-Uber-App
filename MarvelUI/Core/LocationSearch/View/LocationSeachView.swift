//
//  LocationSeachView.swift
//  MarvelUI
//
//  Created by Lucas Hubert on 17/05/23.
//

import SwiftUI

struct LocationSeachView: View {
    @State private var startLocationText = ""
    @State private var destinationLocationText = ""
    @StateObject var viewModel = LocationServiceViewModel()
    
    var body: some View {
        VStack {
            HStack {
                VStack {
                    Circle()
                        .fill(Color(.systemGray3))
                        .frame(width: 6, height: 6)
                    
                    Rectangle()
                        .fill(Color(.systemGray3))
                        .frame(width: 1, height: 24)
                    
                    Rectangle()
                        .fill(Color.black)
                        .frame(width: 6, height: 6)
                }
                
                VStack {
                    TextField("Current Location", text:
                        $startLocationText
                    )
                    .frame(height: 32)
                    .background(Color(.systemGroupedBackground))
                    .padding(.trailing)
                    
                    TextField("Where to?", text:
                                $viewModel.queryFragment
                    )
                    .frame(height: 32)
                    .background(Color(.systemGray4))
                    .padding(.trailing)
                }
            }
            .padding(.horizontal)
            .padding(.top, 64)
            
            Divider()
                .padding(.vertical)
            
            ScrollView {
                VStack(alignment: .leading) {
                    ForEach(0 ..< 20, id: \.self) { _ in
                        LocationSearchResultCell()
                    }
                }
            }
        }
        .background(.white)
        .opacity(0.9)
    }
}

struct LocationSeachView_Previews: PreviewProvider {
    static var previews: some View {
        LocationSeachView()
    }
}
