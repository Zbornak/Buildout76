//
//  EquipmentMainView.swift
//  Buildout76
//
//  Created by Mark Strijdom on 20/04/2023.
//

import SwiftUI

struct RangedWeaponView: View {
    @EnvironmentObject var equipment: Equipment
    
    var body: some View {
        ForEach(equipment.rangedWeapons, id: \.self) { rangedWeapon in
            Text(rangedWeapon)
        }
    }
}

struct EquipmentMainView: View {
    @EnvironmentObject var equipment: Equipment
    
    @State private var equipmentSelectionSaved = false
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    Picker("Name", selection: $equipment.selectedRangedWeapon) {
                        ForEach(equipment.rangedWeapons, id: \.self) {
                            Text($0)
                        }
                    }
                    
                    Picker("★", selection: $equipment.selectedRangedPrefix1) {
                        ForEach(equipment.rangedPrefixes1, id: \.self) {
                            Text($0)
                        }
                    }
                    
                    Picker("★★", selection: $equipment.selectedRangedPrefix2) {
                        ForEach(equipment.rangedPrefixes2, id: \.self) {
                            Text($0)
                        }
                    }
                    
                    Picker("★★★", selection: $equipment.selectedRangedPrefix3) {
                        ForEach(equipment.rangedPrefixes3, id: \.self) {
                            Text($0)
                        }
                    }
                } header: {
                    Label("Ranged Weapon", systemImage: "figure.hunting")
                }
                
                Section {
                    Picker("Name", selection: $equipment.selectedMeleeWeapon) {
                        ForEach(equipment.meleeWeapons, id: \.self) {
                            Text($0)
                        }
                    }
                    
                    Picker("★", selection: $equipment.selectedMeleePrefix1) {
                        ForEach(equipment.meleePrefixes1, id: \.self) {
                            Text($0)
                        }
                    }
                    
                    Picker("★★", selection: $equipment.selectedMeleePrefix2) {
                        ForEach(equipment.meleePrefixes2, id: \.self) {
                            Text($0)
                        }
                    }
                    
                    Picker("★★★", selection: $equipment.selectedMeleePrefix3) {
                        ForEach(equipment.meleePrefixes3, id: \.self) {
                            Text($0)
                        }
                    }
                } header: {
                    Label("Melee Weapon", systemImage: "figure.fencing")
                }
                
                Section {
                    Picker("Name", selection: $equipment.selectedUnderarmor) {
                        ForEach(equipment.underarmors, id: \.self) {
                            Text($0)
                        }
                    }
                } header: {
                    Label("Underarmor", systemImage: "figure.arms.open")
                }
                
                Section {
                    Text("Forest Scout")
                        .fontWeight(.bold)
                    Text("Unyielding")
                        .foregroundColor(.secondary)
                    Text("Ammo Weight Reduction")
                        .foregroundColor(.secondary)
                    Text("+1 Luck")
                        .foregroundColor(.secondary)
                } header: {
                    Label("Armor", systemImage: "shield.fill")
                }
                
                Section {
                    Text("T-65")
                        .fontWeight(.bold)
                    Text("Assassin's")
                        .foregroundColor(.secondary)
                    Text("Ammo Weight Reduction")
                        .foregroundColor(.secondary)
                    Text("AP Cost Reduction")
                        .foregroundColor(.secondary)
                } header: {
                    Label("Power Armor", systemImage: "bolt.shield.fill")
                }
            }
            .toolbar {
                Button("Save") {
                    equipmentSelectionSaved = true
                }
            }
            
            .alert("Equipment selection saved!", isPresented: $equipmentSelectionSaved) {
                Button("OK", role: .cancel) { }
            }
        }
    }
}

struct EquipmentMainView_Previews: PreviewProvider {
    static var previews: some View {
        EquipmentMainView()
            .environmentObject(Equipment())
    }
}
