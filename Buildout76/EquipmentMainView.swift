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
    
    @State private var rangedWeaponViewIsShowing = false
    
    var body: some View {
        Form {
            Section {
                Text(equipment.selectedRangedWeapon)
                    .fontWeight(.bold)
                Text(equipment.selectedRangedPrefix1)
                    .foregroundColor(.secondary)
                Text(equipment.selectedRangedPrefix2)
                    .foregroundColor(.secondary)
                Text(equipment.selectedRangedPrefix3)
                    .foregroundColor(.secondary)
            } header: {
                Label("Ranged Weapon", systemImage: "figure.hunting")
            }
            
            Section {
                Text(equipment.selectedMeleeWeapon)
                    .fontWeight(.bold)
                Text(equipment.selectedMeleePrefix1)
                    .foregroundColor(.secondary)
                Text(equipment.selectedMeleePrefix2)
                    .foregroundColor(.secondary)
                Text(equipment.selectedMeleePrefix3)
                    .foregroundColor(.secondary)
            } header: {
                Label("Melee Weapon", systemImage: "figure.fencing")
            }
            
            Section {
                Text(equipment.selectedUnderarmor)
                    .fontWeight(.bold)
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
    }
}

struct EquipmentMainView_Previews: PreviewProvider {
    static var previews: some View {
        EquipmentMainView()
            .environmentObject(Equipment())
    }
}
