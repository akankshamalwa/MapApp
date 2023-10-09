//
//  LocationListView.swift
//  MapApp
//
//  Created by Akanksha Malawade on 19/09/23.
//

import SwiftUI

struct LocationListView: View {

    @Binding var hasShowListView: Bool
    @EnvironmentObject private var viewModel: LocationsViewModel

    var body: some View {
        List {
            ForEach(viewModel.locations) { location in
                Button {
                    viewModel.updateLocation(location: location)
                    hasShowListView.toggle()

                } label: {
                    listView(location: location)
                }
                .padding(.vertical, 4)
            }
        }
        .listStyle(.sidebar)
        .frame(height: 450)
    }
}

//struct LocationListView_Previews: PreviewProvider {
//    static var previews: some View {
//        let isListViewShow: Bool = false
//        LocationListView(hasShowListView: $isListViewShow)
//            .environmentObject(LocationsViewModel())
//    }
//}

extension LocationListView {
    private func listView(location: Location) -> some View {
        HStack {
            if let imageName = location.imageNames.first {
                Image(imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 45, height: 45)
                    .cornerRadius(10)
            }

            VStack(alignment: .leading, spacing: 10) {
                Text(location.name)
                    .font(.headline)
                    .opacity(0.8)
                Text(location.cityName)
                    .font(.subheadline)
                    .opacity(0.5)
            }
        }
    }
}
