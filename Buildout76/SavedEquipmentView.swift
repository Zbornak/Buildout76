//
//  SavedEquipmentView.swift
//  Buildout76
//
//  Created by Mark Strijdom on 21/04/2023.
//

import SwiftUI

struct SavedEquipmentView: View {
    @EnvironmentObject var equipment: Equipment
    
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
                Text("Ranged Weapon")
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
                Text("Melee Weapon")
            }
            
            Section {
                Text(equipment.selectedUnderarmor)
                    .fontWeight(.bold)
            } header: {
                Text("Underarmor")
            }
            
            Section {
                Text(equipment.selectedArmor)
                    .fontWeight(.bold)
                Text(equipment.selectedArmorPrefix1)
                    .foregroundColor(.secondary)
                Text(equipment.selectedArmorPrefix2)
                    .foregroundColor(.secondary)
                Text(equipment.selectedArmorPrefix3)
                    .foregroundColor(.secondary)
            } header: {
                Text("Armor")
            }
            
            Section {
                Text(equipment.selectedPowerArmor)
                    .fontWeight(.bold)
                Text(equipment.selectedPowerArmorPrefix1)
                    .foregroundColor(.secondary)
                Text(equipment.selectedPowerArmorPrefix2)
                    .foregroundColor(.secondary)
                Text(equipment.selectedPowerArmorPrefix3)
                    .foregroundColor(.secondary)
            } header: {
                Text("Power Armor")
            }
        }
    }
}

struct SavedEquipmentView_Previews: PreviewProvider {
    static var previews: some View {
        SavedEquipmentView()
            .environmentObject(Equipment())
    }
}
