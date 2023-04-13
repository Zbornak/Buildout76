//
//  BuildDetailView.swift
//  Buildout76
//
//  Created by Mark Strijdom on 08/04/2023.
//

import SwiftUI

struct BuildDetailView: View {
    let build: Build
    
    let columns = [GridItem(.adaptive(minimum: 150))]
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: columns, spacing: 20) {
                ForEach(build.perks, id: \.id) { perk in
                    PerkCardSummaryView(perk: perk.perk)
                }
            }
            .padding(.horizontal)
        }
        .navigationTitle(build.name)
    }
}

struct BuildDetailView_Previews: PreviewProvider {
    static var previews: some View {
        BuildDetailView(build: Build.example)
    }
}
