//
//  ContentView.swift
//  Buildout76
//
//  Created by Mark Strijdom on 12/04/2023.
//

import SwiftUI

struct ContentView: View {
    @StateObject var builds = Builds()
    
    var body: some View {
        TabView {
            AllPerksView()
                .tabItem {
                    Label("Perks", systemImage: "person.crop.circle.fill.badge.plus")
                }
            
            BuildProgressView(pickedPerks: .constant([PickedPerk.example]))
                .tabItem {
                    Label("In Progress", systemImage: "gearshape.2")
                }
        }
        .environmentObject(builds)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
