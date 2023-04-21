//
//  Equipment.swift
//  Buildout76
//
//  Created by Mark Strijdom on 21/04/2023.
//

import SwiftUI

class Equipment: ObservableObject {
    let rangedWeapons: [String]
    let underarmors: [String]
    let meleeWeapons: [String]
    let armors: [String]
    let powerArmors: [String]
    
    let rangedPrefixes1: [String]
    let rangedPrefixes2: [String]
    let rangedPrefixes3: [String]
    
    let meleePrefixes1: [String]
    let meleePrefixes2: [String]
    let meleePrefixes3: [String]
    
    let armorPrefixes1: [String]
    let armorPrefixes2: [String]
    let armorPrefixes3: [String]
    
    let powerArmorPrefixes1: [String]
    let powerArmorPrefixes2: [String]
    let powerArmorPrefixes3: [String]
    
    @Published var selectedRangedWeapon: String
    @Published var selectedUnderarmor: String
    @Published var selectedMeleeWeapon: String
    @Published var selectedArmor: String
    @Published var selectedPowerArmor: String
    
    @Published var selectedRangedPrefix1: String
    @Published var selectedRangedPrefix2: String
    @Published var selectedRangedPrefix3: String
    
    @Published var selectedMeleePrefix1: String
    @Published var selectedMeleePrefix2: String
    @Published var selectedMeleePrefix3: String
    
    @Published var selectedArmorPrefix1: String
    @Published var selectedArmorPrefix2: String
    @Published var selectedArmorPrefix3: String
    
    @Published var selectedPowerArmorPrefix1: String
    @Published var selectedPowerArmorPrefix2: String
    @Published var selectedPowerArmorPrefix3: String
    
    init() {
        rangedWeapons = ["Handmade Rifle", "The Fixer", "Gatling Gun"]
        underarmors = ["Secret Service", "Raider Leathers", "Vault76 Jumpsuit"]
        meleeWeapons = ["Bone Hammer", "Super Sledge", "Walking Cane"]
        armors = []
        powerArmors = []
        
        rangedPrefixes1 = ["Anti-Armor", "Bloodied", "Juggernauts"]
        rangedPrefixes2 = ["15% Faster Fire-Rate", "Explosive", "+50% V.A.T.S. Hit Chance"]
        rangedPrefixes3 = ["25% Less V.A.T.S. AP Cost", "15% Faster Fire-Rate", "90% Reduced Weight"]
        
        meleePrefixes1 = ["Anti-Armor", "Bloodied", "Juggernauts"]
        meleePrefixes2 = ["Faster Swing Speed", "+25% Damage While Standing Still", "+40% Power Attack Damage"]
        meleePrefixes3 = ["90% Reduced Weight", "Breaks 50% slower", "+1 Strength"]
        
        armorPrefixes1 = ["Anti-Armor", "Bloodied", "Juggernauts"]
        armorPrefixes2 = ["25 Cryo Resistance", "Ammo Weight Reduction", "Weapon Weight Reduction"]
        armorPrefixes3 = ["+1 Luck", "AP Cost Reduction", "50% More Durability"]
        
        powerArmorPrefixes1 = ["Anti-Armor", "Bloodied", "Juggernauts"]
        powerArmorPrefixes2 = ["25 Cryo Resistance", "Ammo Weight Reduction", "Weapon Weight Reduction"]
        powerArmorPrefixes3 = ["+1 Luck", "AP Cost Reduction", "50% More Durability"]
        
        selectedRangedWeapon = "Handmade Rifle"
        selectedUnderarmor = "Secret Service"
        selectedMeleeWeapon = "Bone Hammer"
        selectedArmor = "Forest Scout"
        selectedPowerArmor = "T-65"
        
        selectedRangedPrefix1 = "Anti-Armor"
        selectedRangedPrefix2 = "15% Faster Fire-Rate"
        selectedRangedPrefix3 = "25% Less V.A.T.S. AP Cost"
    
        selectedMeleePrefix1 = "Bloodied"
        selectedMeleePrefix2 = "Faster Swing Speed"
        selectedMeleePrefix3 = "90% Reduced Weight"
        
        selectedArmorPrefix1 = "Unyielding"
        selectedArmorPrefix2 = "Ammo Weight Reduction"
        selectedArmorPrefix3 = "+1 Luck"
        
        selectedPowerArmorPrefix1 = "Juggernauts"
        selectedPowerArmorPrefix2 = "Weapon Weight Reduction"
        selectedPowerArmorPrefix3 = "AP Cost Reduction"
    }
}
