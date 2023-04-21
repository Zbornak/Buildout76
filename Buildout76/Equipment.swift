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
    
    @Published var selectedRangedWeapon: String
    @Published var selectedUnderarmor: String
    @Published var selectedMeleeWeapon: String
    
    private let saveKey = "Equipment"
    
    init() {
        rangedWeapons = ["Handmade Rifle", "The Fixer", "Gatling Gun"]
        underarmors = ["Secret Service", "Raider Leathers", "Vault76 Jumpsuit"]
        meleeWeapons = ["Bone Hammer", "Super Sledge", "Walking Cane"]
        
        selectedRangedWeapon = "Handmade Rifle"
        selectedUnderarmor = "Secret Service"
        selectedMeleeWeapon = "Bone Hammer"
    }
}
