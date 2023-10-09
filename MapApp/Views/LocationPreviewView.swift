//
//  LocationPreviewView.swift
//  MapApp
//
//  Created by Akanksha Malawade on 19/09/23.
//

import SwiftUI

struct LocationPreviewView: View {
    let location: Location
    var body: some View {
        HStack(alignment: .bottom, spacing: 0) {
            VStack(alignment: .leading, spacing: 16) {
                imageSection
                titleSection
            }
            buttonStackView
        }
        .frame(maxWidth: .infinity)
        .padding(.bottom)
        .background(
            RoundedRectangle(cornerRadius: 20)
                .fill(.ultraThinMaterial)
                .padding(.bottom)   
                .offset(y: 40))
    }
}

struct LocationPreviewView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.pink.ignoresSafeArea()
            LocationPreviewView(location: LocationsDataService.locations.first!)
        }
    }
}

extension LocationPreviewView {

    private var imageSection: some View {
        ZStack {
            if let image = location.imageNames.first {
                Image(image)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 100, height: 100)
                    .cornerRadius(10)
            }
        }
        .padding(6)
        .background(Color.white)
        .cornerRadius(10)
    }

    private var titleSection: some View {
        VStack {
            Text(location.name)
                .font(.headline)
                .opacity(0.9)
            Text(location.cityName)
                .font(.subheadline)
                .opacity(0.5)

        }
    }

    private var buttonStackView: some View {

        VStack {
            Button {

            } label: {
                Text("Learn More")
                    .font(.headline)
                    .frame(width: 150, height: 40)
                    .foregroundColor(.black)
                    .background(Color.pink)
                    .opacity(0.5)
            }.buttonStyle(.bordered)

            Button {

            } label: {
                Text("Next")
                    .font(.headline)
                    .frame(width: 150, height: 40)
                    .foregroundColor(.black)
                    .background(Color.pink)
                    .opacity(0.5)
            }.buttonStyle(.bordered)

        }
    }
}
