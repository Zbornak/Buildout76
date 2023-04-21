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
    let rangedPrefixes1: [String]
    let rangedPrefixes2: [String]
    let rangedPrefixes3: [String]
    let meleePrefixes1: [String]
    let meleePrefixes2: [String]
    let meleePrefixes3: [String]
    
    @Published var selectedRangedWeapon: String
    @Published var selectedUnderarmor: String
    @Published var selectedMeleeWeapon: String
    
    @Published var selectedRangedPrefix1: String
    @Published var selectedRangedPrefix2: String
    @Published var selectedRangedPrefix3: String
    
    @Published var selectedMeleePrefix1: String
    @Published var selectedMeleePrefix2: String
    @Published var selectedMeleePrefix3: String
    
    init() {
        rangedWeapons = ["Handmade Rifle", "The Fixer", "Gatling Gun"]
        underarmors = ["Secret Service", "Raider Leathers", "Vault76 Jumpsuit"]
        meleeWeapons = ["Bone Hammer", "Super Sledge", "Walking Cane"]
        
        rangedPrefixes1 = ["Anti-Armor", "Bloodied", "Juggernauts"]
        rangedPrefixes2 = ["15% Faster Fire-Rate", "Explosive", "+50% V.A.T.S. Hit Chance"]
        rangedPrefixes3 = ["25% Less V.A.T.S. AP Cost", "15% Faster Fire-Rate", "90% Reduced Weight"]
        
        meleePrefixes1 = ["Anti-Armor", "Bloodied", "Juggernauts"]
        meleePrefixes2 = ["Faster Swing Speed", "+25% Damage While Standing Still", "+40% Power Attack Damage"]
        meleePrefixes3 = ["90% Reduced Weight", "Breaks 50% slower", "+1 Strength"]
        
        selectedRangedWeapon = "Handmade Rifle"
        selectedUnderarmor = "Secret Service"
        selectedMeleeWeapon = "Bone Hammer"
        
        selectedRangedPrefix1 = "Anti-Armor"
        selectedRangedPrefix2 = "15% Faster Fire-Rate"
        selectedRangedPrefix3 = "25% Less V.A.T.S. AP Cost"
    
        selectedMeleePrefix1 = "Bloodied"
        selectedMeleePrefix2 = "Faster Swing Speed"
        selectedMeleePrefix3 = "90% Reduced Weight"
    }
}
