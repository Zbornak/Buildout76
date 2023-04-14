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
                    ZStack(alignment: .bottomTrailing) {
                        PerkCardSummaryView(perk: perk.perk)
                            .frame(height: 230)
                        
                        VStack {
                            if perk.perkLevel == 1 {
                                Text(perk.perk.description1)
                                    .padding()
                            } else if perk.perkLevel == 2 {
                                Text(perk.perk.description2 ?? "Unknown description.")
                                    .padding()
                            } else if perk.perkLevel == 3 {
                                Text(perk.perk.description3 ?? "Unknown description.")
                                    .padding()
                            } else if perk.perkLevel == 4 {
                                Text(perk.perk.description4 ?? "Unknown description.")
                                    .padding()
                            } else {
                                Text(perk.perk.description5 ?? "Unknown description.")
                                    .padding()
                            }
                            
                            
                            Text("\(perk.perkLevel)/\(perk.perk.maxLevel)")
                                .padding(.bottom)
                        }
                    }
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
