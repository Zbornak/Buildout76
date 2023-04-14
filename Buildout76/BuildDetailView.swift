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
                            .frame(height: 220)
                        
                        VStack {
                            Text(perkDescription())
                                .padding()
                            
                            Text(perkLevel())
                                .padding(.bottom)
                        }
                    }
                }
            }
            .padding(.horizontal)
        }
        .navigationTitle(build.name)
    }
    
    func perkDescription() -> String {
        for perk in build.perks {
            if perk.perkLevel == 1 {
                return perk.perk.description1
            } else if perk.perkLevel == 2 {
                return perk.perk.description2 ?? "Maximum level reached."
            } else if perk.perkLevel == 3 {
                return perk.perk.description3 ?? "Maximum level reached."
            } else if perk.perkLevel == 4 {
                return perk.perk.description4 ?? "Maximum level reached."
            } else {
                return perk.perk.description5 ?? "Maximum level reached."
            }
        }
        
        return "Unknown description."
    }
    
    func perkLevel() -> String {
        for perk in build.perks {
            if perk.perkLevel == 1 {
                return "★"
            } else if perk.perkLevel == 2 {
                return "★★"
            } else if perk.perkLevel == 3 {
                return "★★★"
            } else if perk.perkLevel == 4 {
                return "★★★★"
            } else {
                return "★★★★★"
            }
        }
        
        return "Unknown level."
    }
}

struct BuildDetailView_Previews: PreviewProvider {
    static var previews: some View {
        BuildDetailView(build: Build.example)
    }
}
