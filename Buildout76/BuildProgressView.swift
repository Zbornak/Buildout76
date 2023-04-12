//
//  BuildProgressView.swift
//  Buildout76
//
//  Created by Mark Strijdom on 12/04/2023.
//

import SwiftUI

struct BuildProgressView: View {
    @Binding var pickedPerks: [PickedPerk]
    
    @State private var buildName = ""
    
    var body: some View {
        Form {
            Section {
                TextField("Enter build name", text: $buildName)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding(.horizontal)
            } header: {
                Text("build name")
            }
            
            Section {
                ForEach(pickedPerks, id: \.id) { pickedPerk in
                    HStack {
                        if pickedPerk.perk.specialCategory.contains("Strength") {
                            NavigationLink {
                                PerkCardView(perk: pickedPerk.perk)
                            } label: {
                                Text(pickedPerk.perk.name)
                                Text("\(pickedPerk.perkLevel)")
                            }
                        }
                    }
                }
            } header: {
                Text("strength perks")
            }
            
            Section {
                ForEach(pickedPerks, id: \.id) { pickedPerk in
                    HStack {
                        if pickedPerk.perk.specialCategory.contains("Perception") {
                            NavigationLink {
                                PerkCardView(perk: pickedPerk.perk)
                            } label: {
                                Text(pickedPerk.perk.name)
                                Text("\(pickedPerk.perkLevel)")
                            }
                        }
                    }
                }
            } header: {
                Text("perception perks")
            }
            
            Section {
                ForEach(pickedPerks, id: \.id) { pickedPerk in
                    HStack {
                        if pickedPerk.perk.specialCategory.contains("Endurance") {
                            NavigationLink {
                                PerkCardView(perk: pickedPerk.perk)
                            } label: {
                                Text(pickedPerk.perk.name)
                                Text("\(pickedPerk.perkLevel)")
                            }
                        }
                    }
                }
            } header: {
                Text("endurance perks")
            }
            
            Section {
                ForEach(pickedPerks, id: \.id) { pickedPerk in
                    HStack {
                        if pickedPerk.perk.specialCategory.contains("Charisma") {
                            NavigationLink {
                                PerkCardView(perk: pickedPerk.perk)
                            } label: {
                                Text(pickedPerk.perk.name)
                                Text("\(pickedPerk.perkLevel)")
                            }
                        }
                    }
                }
            } header: {
                Text("charisma perks")
            }
            
            Section {
                ForEach(pickedPerks, id: \.id) { pickedPerk in
                    HStack {
                        if pickedPerk.perk.specialCategory.contains("Intelligence") {
                            NavigationLink {
                                PerkCardView(perk: pickedPerk.perk)
                            } label: {
                                Text(pickedPerk.perk.name)
                                Text("\(pickedPerk.perkLevel)")
                            }
                        }
                    }
                }
            } header: {
                Text("intelligence perks")
            }
            
            Section {
                ForEach(pickedPerks, id: \.id) { pickedPerk in
                    HStack {
                        if pickedPerk.perk.specialCategory.contains("Agility") {
                            NavigationLink {
                                PerkCardView(perk: pickedPerk.perk)
                            } label: {
                                Text(pickedPerk.perk.name)
                                Text("\(pickedPerk.perkLevel)")
                            }
                        }
                    }
                }
            } header: {
                Text("agility perks")
            }
            
            Section {
                ForEach(pickedPerks, id: \.id) { pickedPerk in
                    HStack {
                        if pickedPerk.perk.specialCategory.contains("Luck") {
                            NavigationLink {
                                PerkCardView(perk: pickedPerk.perk)
                            } label: {
                                Text(pickedPerk.perk.name)
                                Text("\(pickedPerk.perkLevel)")
                            }
                        }
                    }
                }
            } header: {
                Text("luck perks")
            }
        }
    }
}

struct BuildProgressView_Previews: PreviewProvider {
    static var previews: some View {
        BuildProgressView(pickedPerks: .constant([PickedPerk.example]))
    }
}
