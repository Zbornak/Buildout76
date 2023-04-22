//
//  PickedLegendaryPerks.swift
//  Buildout76
//
//  Created by Mark Strijdom on 18/04/2023.
//

import SwiftUI

class PickedLegendaryPerks: ObservableObject {
    @Published var pickedLegendaryPerks: [PickedLegendaryPerk]
    var legendaryPointBoostTotal: Int {
        pickedLegendaryPerks.reduce(0) { partialResult, legendary in
            switch legendary.perk.name {
            case "Legendary Strength": fallthrough;
            case "Legendary Perception": fallthrough;
            case "Legendary Endurance": fallthrough;
            case "Legendary Charisma": fallthrough;
            case "Legendary Intelligence": fallthrough;
            case "Legendary Agility": fallthrough;
            case "Legendary Luck":
                if legendary.perkLevel == 4 {
                    return partialResult + legendary.perkLevel + 1
                } else {
                    return partialResult + legendary.perkLevel
                }
            default:
                return partialResult
            }
        }
    }
    func legendaryPointBoost(forPerk perk: Perk) -> Int {
        let legendaryName = "Legendary \(perk.specialCategory)"
        return pickedLegendaryPerks.reduce(0) { partialResult, legendary in
            if legendary.perk.name == legendaryName {
                return partialResult + legendary.perkLevel
            } else {
                return partialResult
            }
        }
    }
    private let saveKey = "PickedLegendaryPerks"
    
    init() {
        if let data = UserDefaults.standard.data(forKey: saveKey) {
            if let decodedData = try? JSONDecoder().decode([PickedLegendaryPerk].self, from: data) {
                pickedLegendaryPerks = decodedData
                return
            }
        }
        
        pickedLegendaryPerks = []
    }
    
    func add(_ pickedLegendaryPerk: PickedLegendaryPerk) {
        objectWillChange.send()
        pickedLegendaryPerks.append(pickedLegendaryPerk)
        save()
    }
    
    func save() {
        if let encodedData = try? JSONEncoder().encode(pickedLegendaryPerks) {
            UserDefaults.standard.set(encodedData, forKey: saveKey)
        }
    }
    
    func remove(_ pickedLegendaryPerk: PickedLegendaryPerk) {
        objectWillChange.send()
        var indexes = IndexSet()
        if let index = pickedLegendaryPerks.firstIndex(of: pickedLegendaryPerk) {
            indexes.insert(index)
        }
        
        pickedLegendaryPerks.remove(atOffsets: indexes)
        save()
    }
}
