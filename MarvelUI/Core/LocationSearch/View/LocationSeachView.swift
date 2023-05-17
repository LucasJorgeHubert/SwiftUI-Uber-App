//
//  LocationSeachView.swift
//  MarvelUI
//
//  Created by Lucas Hubert on 17/05/23.
//

import SwiftUI

struct LocationSeachView: View {
    @State private var startLocationText = ""
    @Binding var showLocationSearchView: Bool
    @EnvironmentObject var viewModel: LocationSearchViewModel
    
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
                    ForEach(viewModel.resuls, id: \.self) { result in
                        LocationSearchResultCell(title: result.title, subtitle: result.subtitle)
                            .onTapGesture {
                                showLocationSearchView.toggle()
                                viewModel.selectLocation(result.title)
                            }
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
        LocationSeachView(showLocationSearchView: .constant(true))
    }
}
