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
    @StateObject var legendaryPerks = LegendaryPerks()
    @StateObject var mutations = Mutations()
    
    var body: some View {
        TabView {
            SavedBuildsListView()
                .tabItem {
                    Label("Builds", systemImage: "gearshape.circle")
                }
            
            AllPerksView(build: Build.example)
                .tabItem {
                    Label("Perks", systemImage: "person.crop.circle.fill.badge.plus")
                }
            
            BuildProgressView(build: Build.example)
                .tabItem {
                    Label("In Progress", systemImage: "gearshape.2")
                }
        }
        .environmentObject(builds)
        .environmentObject(pickedPerks)
        .environmentObject(legendaryPerks)
        .environmentObject(mutations)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
