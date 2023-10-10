//
//  LocationSeachView.swift
//  eUberUI
//
//  Created by Lucas Hubert on 17/05/23.
//

import SwiftUI

struct LocationSearchView: View {
    enum FocusField: Hashable {
        case destinationField
    }

    @FocusState private var focusedField: FocusField?
    
    @State private var startLocationText = ""
    @Binding var mapState: MapViewState
    @EnvironmentObject var viewModel: LocationSearchViewModel
    
    var body: some View {
        VStack {
            HStack {
                VStack {
                    Circle()
                        .fill(Color(.systemYellow))
                        .frame(width: 6, height: 6)
                        .opacity(0.8)
                    
                    Rectangle()
                        .fill(Color(.systemYellow))
                        .frame(width: 1, height: 24)
                        .opacity(0.6)
                    
                    Rectangle()
                        .fill(Color(.systemYellow))
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
                    .focused($focusedField, equals: .destinationField)
                    .onAppear {
                        self.focusedField = .destinationField
                    }
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
                                withAnimation {
                                    mapState = .locationSelected
                                    viewModel.selectLocation(result)
                                }
                            }
                    }
                }
            }
        }
        .background(Color.theme.backgroundColor)
        .opacity(0.9)
    }
}

struct LocationSeachView_Previews: PreviewProvider {
    static var previews: some View {
        LocationSearchView(mapState: .constant(.searchingForLocation))
    }
}
