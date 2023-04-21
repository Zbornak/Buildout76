//
//  Equipment.swift
//  Buildout76
//
//  Created by Mark Strijdom on 21/04/2023.
//

import SwiftUI

class Equipment: ObservableObject {
    @Published var rangedWeapons: [String]
    @Published var underArmors: [String]
    @Published var meleeWeapons: [String]
    
    private let saveKey = "Equipment"
    
    init() {
        if let data = UserDefaults.standard.data(forKey: saveKey) {
            if let decodedData = try? JSONDecoder().decode([String].self, from: data) {
                rangedWeapons = decodedData
                underArmors = decodedData
                meleeWeapons = decodedData
                return
            }
        }
        
        rangedWeapons = ["Handmade Rifle", "The Fixer", "Gatling Gun"]
        underArmors = ["Secret Service", "Raider Leathers", "Vault76 Jumpsuit"]
        meleeWeapons = ["Bone Hammer", "Super Sledge", "Walking Cane"]
    }
}
