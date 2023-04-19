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
    
    enum FilterType: CaseIterable {
        case strength, perception, endurance, charisma, intelligence, agility, luck
    }
    
    var body: some View {
        ScrollView {
            Text("Legendary")
                .font(.title2)
                .fontWeight(.bold)
                .padding()
            
            Text("Mutations")
                .font(.title2)
                .fontWeight(.bold)
                .padding()
            
            ForEach(build.mutations, id: \.id) { mutation in
                VStack {
                    Text("⚛︎ \(mutation.name)")
                        .fontWeight(.bold)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    Text(" (\(mutation.descriptionPositive), \(mutation.descriptionNegative))")
                        .frame(maxWidth: .infinity, alignment: .leading)
                }
                .padding()
            }
            
            
            ForEach(FilterType.allCases, id: \.self) { filter in
                Text(title(filter))
                    .font(.title2)
                    .fontWeight(.bold)
                    .padding()
                
                LazyVGrid(columns: columns, spacing: 20) {
                    ForEach(filteredBuildPerks(filter), id: \.id) { perk in
                        ZStack(alignment: .bottomTrailing) {
                            PerkCardSummaryView(perk: perk.perk)
                                .frame(height: 250)
                            
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
                                
                                
                                Text("\(perk.perkLevelStarDisplay())\(perk.remainingStars())")
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
    
    func title(_ filter: FilterType) -> String {
        switch filter {
        case .strength:
            return "Strength"
        case .perception:
            return "Perception"
        case .endurance:
            return "Endurance"
        case .charisma:
            return "Charisma"
        case .intelligence:
            return "Intelligence"
        case .agility:
            return "Agility"
        case .luck:
            return "Luck"
        }
    }
    
    func filteredBuildPerks(_ filter: FilterType) -> [PickedPerk] {
        switch filter {
        case .strength:
            return build.perks.filter { $0.perk.specialCategory == "Strength" }
        case .perception:
            return build.perks.filter { $0.perk.specialCategory == "Perception" }
        case .endurance:
            return build.perks.filter { $0.perk.specialCategory == "Endurance" }
        case .charisma:
            return build.perks.filter { $0.perk.specialCategory == "Charisma" }
        case .intelligence:
            return build.perks.filter { $0.perk.specialCategory == "Intelligence" }
        case .agility:
            return build.perks.filter { $0.perk.specialCategory == "Agility" }
        case .luck:
            return build.perks.filter { $0.perk.specialCategory == "Luck" }
        }
    }
}

struct BuildDetailView_Previews: PreviewProvider {
    static var previews: some View {
        BuildDetailView(build: Build.example)
    }
}
