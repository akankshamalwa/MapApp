//
//  LocationsView.swift
//  MapApp
//
//  Created by Akanksha Malawade on 19/09/23.
//

import SwiftUI
import MapKit

struct LocationsView: View {

    @State private var hasShowListView: Bool = false
    @EnvironmentObject private var viewModel: LocationsViewModel
    var body: some View {
        ZStack {
            Map(coordinateRegion: $viewModel.mapRegion)
                .ignoresSafeArea()
            VStack(spacing: 0) {
                headerView
                    .padding()
                Spacer()
                ZStack {
                    ForEach(viewModel.locations) { location in
                        if viewModel.mapLocation == location {
                            LocationPreviewView(location: location)
                                .shadow(color: Color.black.opacity(0.3), radius: 20)
                                .padding()
                                .transition(.asymmetric(insertion: .move(edge: .trailing), removal: .move(edge: .leading)))
                        }
                    }
                }
            }
        }
    }
}

struct LocationsView_Previews: PreviewProvider {
    static var previews: some View {
        LocationsView()
            .environmentObject(LocationsViewModel())
    }
}

extension LocationsView {
    private var headerView: some View {
        VStack {
            Button {
                hasShowListView.toggle()
            } label: {
                Text(viewModel.mapLocation.name + ", " + viewModel.mapLocation.cityName)
                    .font(.title2)
                    .foregroundColor(.black)
                    .fontWeight(.bold)
                    .frame(height: 55)
                    .frame(maxWidth: .infinity)
                    .animation(.none, value: viewModel.mapLocation)
                    .overlay(alignment: .leading) {
                        Image(systemName: "arrow.down")
                            .font(.headline)
                            .foregroundColor(.black)
                            .padding()
                            .rotationEffect(Angle(degrees: hasShowListView ? 180 : 0))
                    }
            }

            if hasShowListView {
                LocationListView(hasShowListView: $hasShowListView)
            }
        }
        .background(.thickMaterial)
        .cornerRadius(10)
        .shadow(radius: 5)
    }
}
