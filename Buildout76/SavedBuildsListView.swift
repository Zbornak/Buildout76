//
//  SavedBuildsListView.swift
//  Buildout76
//
//  Created by Mark Strijdom on 13/04/2023.
//

import SwiftUI

struct SavedBuildsListView: View {
    @EnvironmentObject var builds: Builds
    
    var body: some View {
        NavigationView {
            VStack {
                List {
                    ForEach(builds.builds) { build in
                        NavigationLink {
                            BuildDetailView(build: build)
                        } label: {
                            Text(build.name)
                        }
                    }
                    .onDelete(perform: deleteItems)
                }
                
                if builds.builds.isEmpty {
                    VStack {
                        Text("Go to the Perks tab to begin!")
                        Text("↓")
                    }
                }
            }
            .toolbar {
                EditButton()
            }
        }
    }
    
    func deleteItems(at offsets: IndexSet) {
        builds.objectWillChange.send()
        builds.builds.remove(atOffsets: offsets)
        builds.save()
    }
}

struct SavedBuildsListView_Previews: PreviewProvider {
    static var previews: some View {
        SavedBuildsListView()
            .environmentObject(Builds())
    }
}
