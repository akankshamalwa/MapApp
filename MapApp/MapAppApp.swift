//
//  MapAppApp.swift
//  MapApp
//
//  Created by Akanksha Malawade on 19/09/23.
//

import SwiftUI

@main
struct MapAppApp: App {

    @StateObject private var viewModel = LocationsViewModel()
    var body: some Scene {
        WindowGroup {
            LocationsView()
                .environmentObject(viewModel)
        }
    }
}
