//
//  BuildProgressView.swift
//  Buildout76
//
//  Created by Mark Strijdom on 12/04/2023.
//

import SwiftUI

struct BuildProgressView: View {
    @EnvironmentObject var pickedPerks: PickedPerks
    
    @State private var buildName = ""
    
    enum FilterType: CaseIterable {
        case strength, perception, endurance, charisma, intelligence, agility, luck
    }
    
    func header(_ filter: FilterType) -> String {
        switch filter {
        case .strength:
            return "strength perks"
        case .perception:
            return "perception perks"
        case .endurance:
            return "endurance perks"
        case .charisma:
            return "charisma perks"
        case .intelligence:
            return "intelligence perks"
        case .agility:
            return "agility perks"
        case .luck:
            return "luck perks"
        }
    }
    
    func filteredPickedPerks(_ filter: FilterType) -> [PickedPerk] {
        switch filter {
        case .strength:
            return pickedPerks.pickedPerks.filter { $0.perk.specialCategory == "Strength" }
        case .perception:
            return pickedPerks.pickedPerks.filter { $0.perk.specialCategory == "Perception" }
        case .endurance:
            return pickedPerks.pickedPerks.filter { $0.perk.specialCategory == "Endurance" }
        case .charisma:
            return pickedPerks.pickedPerks.filter { $0.perk.specialCategory == "Charisma" }
        case .intelligence:
            return pickedPerks.pickedPerks.filter { $0.perk.specialCategory == "Intelligence" }
        case .agility:
            return pickedPerks.pickedPerks.filter { $0.perk.specialCategory == "Agility" }
        case .luck:
            return pickedPerks.pickedPerks.filter { $0.perk.specialCategory == "Luck" }
        }
    }
    
    var body: some View {
        Form {
            TextField("Enter build name", text: $buildName)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(.horizontal)
            
            ForEach(FilterType.allCases, id: \.self) { filter in
                Section {
                    ForEach(filteredPickedPerks(filter)) { perk in
                        NavigationLink {
                            PerkCardView(perk: perk.perk)
                        } label: {
                            HStack {
                                Text(perk.perk.name)
                                Text("\(perk.perkLevel)")
                            }
                        }
                    }
                } header: {
                    Text(header(filter))
                }
            }
        }
    }
}

struct BuildProgressView_Previews: PreviewProvider {
    static var previews: some View {
        BuildProgressView()
            .environmentObject(PickedPerks())
    }
}
