//
//  BuildProgressView.swift
//  Buildout76
//
//  Created by Mark Strijdom on 12/04/2023.
//

import SwiftUI

struct BuildProgressView: View {
    @EnvironmentObject var pickedPerks: PickedPerks
    @EnvironmentObject var builds: Builds
    
    @State private var buildName = ""
    @State var build: Build
    @State private var buildSaved = false
    
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
            return pickedPerks.perks.filter { $0.perk.specialCategory == "Strength" }
        case .perception:
            return pickedPerks.perks.filter { $0.perk.specialCategory == "Perception" }
        case .endurance:
            return pickedPerks.perks.filter { $0.perk.specialCategory == "Endurance" }
        case .charisma:
            return pickedPerks.perks.filter { $0.perk.specialCategory == "Charisma" }
        case .intelligence:
            return pickedPerks.perks.filter { $0.perk.specialCategory == "Intelligence" }
        case .agility:
            return pickedPerks.perks.filter { $0.perk.specialCategory == "Agility" }
        case .luck:
            return pickedPerks.perks.filter { $0.perk.specialCategory == "Luck" }
        }
    }
    
    var body: some View {
        NavigationView {
            Form {
                TextField("Enter build name", text: $buildName)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding(.horizontal)
            
                ForEach(FilterType.allCases, id: \.self) { filter in
                    Section {
                        ForEach(filteredPickedPerks(filter)) { perk in
                            NavigationLink {
                                ZStack {
                                    PerkCardSummaryView(perk: perk.perk)
                                        .padding()
                                    
                                    VStack {
                                        switch perk.perkLevel {
                                        case 1:
                                            Text(perk.perk.description1)
                                                .padding()
                                        case 2:
                                            Text(perk.perk.description2 ?? "Unknown description.")
                                                .padding()
                                        case 3:
                                            Text(perk.perk.description3 ?? "Unknown description.")
                                                .padding()
                                        case 4:
                                            Text(perk.perk.description4 ?? "Unknown description.")
                                                .padding()
                                        default:
                                            Text(perk.perk.description5 ?? "Unknown description.")
                                                .padding()
                                        }
                                        
                                        Text("\(perk.perkLevel)/\(perk.perk.maxLevel)")
                                            .padding(.bottom)
                                    }
                                    .padding()
                                }
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
                .onDelete(perform: deleteItems)
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button {
                        let build = Build(name: buildName, perks: pickedPerks.perks)
                        pickedPerks.objectWillChange.send()
                        builds.objectWillChange.send()
                        builds.add(build)
                        pickedPerks.perks.removeAll()
                        builds.save()
                        pickedPerks.save()
                        buildName = ""
                        buildSaved = true
                    } label: {
                        Text("Save")
                    }
                }
            }
            .navigationTitle("⚛︎ Build in Progress")
            .alert("Build saved!", isPresented: $buildSaved) {
                Button("OK", role: .cancel) { }
            }
        }
    }
    
    func deleteItems(at offsets: IndexSet) {
        pickedPerks.objectWillChange.send()
        pickedPerks.perks.remove(atOffsets: offsets)
        pickedPerks.save()
    }
}

struct BuildProgressView_Previews: PreviewProvider {
    static var previews: some View {
        BuildProgressView(build: Build.example)
            .environmentObject(PickedPerks())
            .environmentObject(Builds())
    }
}
