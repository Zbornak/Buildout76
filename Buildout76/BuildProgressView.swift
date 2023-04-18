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
    @State private var clearWarningShowing = false
    
    enum FilterType: CaseIterable {
        case strength, perception, endurance, charisma, intelligence, agility, luck
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
                                        selectDescription(of: perk)
                                            .padding()
                                        
                                        Text("\(perk.perkLevelStarDisplay())\(perk.remainingStars())")
                                            .padding(.bottom)
                                    }
                                    .padding()
                                }
                            } label: {
                                HStack {
                                    Text(perk.perk.name)
                                    Text("\(perk.perkLevelStarDisplay())\(perk.remainingStars())")
                                }
                            }
                            .swipeActions {
                                Button(role: .destructive) {
                                    pickedPerks.remove(perk)
                                } label: {
                                    Image(systemName: "trash")
                                }
                            }
                        }
                    } header: {
                        Text(header(filter))
                    }
                }
            }
            .toolbar {
                Button("Clear") {
                    clearWarningShowing = true
                }
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
            .alert("Are you sure you want to clear all perks and start again?", isPresented: $clearWarningShowing) {
                Button("Yes", role: .destructive) {
                    pickedPerks.objectWillChange.send()
                    pickedPerks.perks.removeAll()
                    pickedPerks.save()
                }
            }
        }
    }
    
    func selectDescription(of perk: PickedPerk) -> Text {
        switch perk.perkLevel {
        case 1:
            return Text(perk.perk.description1)
        case 2:
            return Text(perk.perk.description2 ?? "Unknown description.")
        case 3:
            return Text(perk.perk.description3 ?? "Unknown description.")
        case 4:
            return Text(perk.perk.description4 ?? "Unknown description.")
        default:
            return Text(perk.perk.description5 ?? "Unknown description.")
        }
    }
    
    func header(_ filter: FilterType) -> String {
        switch filter {
        case .strength:
            return "strength"
        case .perception:
            return "perception"
        case .endurance:
            return "endurance"
        case .charisma:
            return "charisma"
        case .intelligence:
            return "intelligence"
        case .agility:
            return "agility"
        case .luck:
            return "luck"
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
}

struct BuildProgressView_Previews: PreviewProvider {
    static var previews: some View {
        BuildProgressView(build: Build.example)
            .environmentObject(PickedPerks())
            .environmentObject(Builds())
    }
}
