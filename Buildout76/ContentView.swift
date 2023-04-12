//
//  ContentView.swift
//  Buildout76
//
//  Created by Mark Strijdom on 12/04/2023.
//

import SwiftUI

struct ContentView: View {
    @StateObject var builds = Builds()
    @StateObject var pickedPerks = PickedPerks()
    
    var body: some View {
        TabView {
            AllPerksView()
                .tabItem {
                    Label("Perks", systemImage: "person.crop.circle.fill.badge.plus")
                }
            
            BuildProgressView(filter: .strength)
                .tabItem {
                    Label("In Progress", systemImage: "gearshape.2")
                }
        }
        .environmentObject(builds)
        .environmentObject(pickedPerks)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
