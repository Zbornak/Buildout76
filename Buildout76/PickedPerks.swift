//
//  PickedPerks.swift
//  Buildout76
//
//  Created by Mark Strijdom on 12/04/2023.
//

import SwiftUI

class PickedPerks: ObservableObject {
    @Published var perks: [PickedPerk]
    
    var remainingStrengthPoints: Int {
        var pointsRemaining = 15
        for perk in perks {
            if perk.perk.specialCategory.contains("Strength") {
                pointsRemaining -= perk.perkLevel
            }
        }
        
        return pointsRemaining
    }
    
    private let saveKey = "PickedPerks"
    
    init() {
        if let data = UserDefaults.standard.data(forKey: saveKey) {
            if let decodedData = try? JSONDecoder().decode([PickedPerk].self, from: data) {
                perks = decodedData
                return
            }
        }
        
        perks = []
    }
    
    func add(_ pickedPerk: PickedPerk) {
        objectWillChange.send()
        perks.append(pickedPerk)
        save()
    }
    
    func save() {
        if let encodedData = try? JSONEncoder().encode(perks) {
            UserDefaults.standard.set(encodedData, forKey: saveKey)
        }
    }
    
    func removePerk(_ perk: PickedPerk) {
        objectWillChange.send()
        var indexes = IndexSet()
        if let index = perks.firstIndex(of: perk) {
            indexes.insert(index)
        }
        
        perks.remove(atOffsets: indexes)
        save()
    }
}

