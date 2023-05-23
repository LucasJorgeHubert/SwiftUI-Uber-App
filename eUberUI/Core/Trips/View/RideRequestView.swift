//
//  RideRequestView.swift
//  eUberUI
//
//  Created by Lucas Hubert on 18/05/23.
//

import SwiftUI

struct RideRequestView: View {
    
    @State private var selectedRideType: RideType = .eUberX
    @EnvironmentObject var locationViewModel: LocationSearchViewModel
    
    var body: some View {
        VStack {
            Capsule()
                .foregroundColor((Color(.systemYellow)))
                .frame(width: 48, height: 8)
                .opacity(0.3)
                .padding(.vertical, 8)
            
            HStack {
                VStack {
                    Circle()
                        .fill(Color(.systemYellow))
                        .frame(width: 8, height: 8)
                        .opacity(0.8)
                    
                    Rectangle()
                        .fill(Color(.systemYellow))
                        .frame(width: 1, height: 32)
                        .opacity(0.6)
                    
                    Rectangle()
                        .fill(Color(.systemYellow))
                        .frame(width: 8, height: 8)
                }
                
                VStack(alignment: .leading, spacing: 24) {
                    HStack {
                        Text("Current location")
                            .font(.system(size: 16))
                            .foregroundColor(.gray)
                        
                        Spacer()
                        
                        Text(locationViewModel.pickupTime ?? "-")
                            .font(.system(size: 14, weight: .bold))
                            .foregroundColor(.gray)
                    }
                    .padding(.bottom, 10)
                    
                    HStack {
                        if let location = locationViewModel.selectedEUberLocation {
                            Text(location.title)
                                .font(.system(size: 16, weight: .semibold))
                                .foregroundColor(.gray)
                        }
                        
                        Spacer()
                        
                        Text(locationViewModel.dropOffTime ?? "-")
                            .font(.system(size: 14, weight: .bold))
                            .foregroundColor(.gray)
                    }
                    
                    
                    
                    
                }
                
            }
            .padding()
            
            Divider()
            
            Text("SUGGESTED RIDES")
                .font(.subheadline)
                .fontWeight(.semibold)
                .padding()
                .foregroundColor(.gray)
                .frame(maxWidth: .infinity, alignment: .leading)
            
            ScrollView(.horizontal) {
                HStack(spacing: 12) {
                    ForEach(RideType.allCases, id: \.self) { rideType in
                        VStack {
                            Image(rideType.imageName)
                                .resizable()
                                .scaledToFit()
                                .frame(width: 48, height: 48)
                            
                            VStack(alignment: .leading, spacing: 4) {
                                Text(rideType.description)
                                    .font(.system(size: 14, weight: .semibold))
                                                  
                                Text(locationViewModel.computeRidePrice(forType: rideType).toCurrency())
                                    .font(.system(size: 14, weight: .semibold))
                            }
                        }
                        .padding(.top, 8)
                        .frame(width: 112, height: 140)
                        .foregroundColor(rideType == selectedRideType ? .black : Color.theme.primaryTextColor)
                        .background(rideType == selectedRideType ? .yellow : Color.theme.secondaryBackgroundColor)
                        .scaleEffect(rideType == selectedRideType ? 1.1 : 1.0)
                        .cornerRadius(10)
                        .onTapGesture {
                            withAnimation(.linear) {
                                selectedRideType = rideType
                            }
                        }
                    }
                }
            }.padding(.horizontal)
            
            Divider()
                .padding(.vertical, 8)
            
            HStack(spacing: 12) {
                Text("eVisa")
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .padding(6)
                    .background(.blue)
                    .cornerRadius(4)
                    .foregroundColor(.white)
                    .padding(.leading)
                
                Text("**** 1234")
                    .fontWeight(.bold)
                
                Spacer()
                Image(systemName: "chevron.right")
                    .imageScale(.medium)
                    .padding()
            }
            .frame(height: 50)
            .background(Color(.systemGray3).opacity(0.5))
            .cornerRadius(10)
            .padding(.horizontal)
            
            Button {
                
            } label: {
                Text("CONFIRM RIDE")
                    .fontWeight(.bold)
                    .frame(width: UIScreen.main.bounds.width - 32, height: 50)
                    .background(.yellow)
                    .cornerRadius(10)
                    .foregroundColor(.black)
            }
            
        }
        .padding(.bottom, 24)
        .background(Color.theme.backgroundColor)
        .cornerRadius(16)
    }
}

struct RideRequestView_Previews: PreviewProvider {
    static var previews: some View {
        RideRequestView()
    }
}
