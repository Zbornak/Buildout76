//
//  PickedPerks.swift
//  Buildout76
//
//  Created by Mark Strijdom on 12/04/2023.
//

import SwiftUI

class PickedPerks: ObservableObject {
    @Published var perks: [PickedPerk]
    
    var totalPerkPoints: Int {
        var points = 56
        for perk in perks {
            points -= perk.perkLevel
        }
        
        return points
    }
    
    var totalStrengthPerkPoints: Int {
        var points = 15
        for perk in perks {
            points -= perk.perkLevel
        }
        
        return points
    }
    
    var totalPerceptionPerkPoints: Int {
        var points = 15
        for perk in perks {
            points -= perk.perkLevel
        }
        
        return points
    }
    
    var totalEndurancePerkPoints: Int {
        var points = 15
        for perk in perks {
            points -= perk.perkLevel
        }
        
        return points
    }
    
    var totalCharismaPerkPoints: Int {
        var points = 15
        for perk in perks {
            points -= perk.perkLevel
        }
        
        return points
    }
    
    var totalIntelligencePerkPoints: Int {
        var points = 15
        for perk in perks {
            points -= perk.perkLevel
        }
        
        return points
    }
    
    var totalAgilityPerkPoints: Int {
        var points = 15
        for perk in perks {
            points -= perk.perkLevel
        }
        
        return points
    }
    
    var totalLuckPerkPoints: Int {
        var points = 15
        for perk in perks {
            points -= perk.perkLevel
        }
        
        return points
    }
    
    var strengthPoints: Int {
        var points = 0
        for perk in perks {
            if perk.perk.specialCategory.contains("Strength") {
                points += perk.perkLevel
            }
        }
        
        return points
    }
    
    var perceptionPoints: Int {
        var points = 0
        for perk in perks {
            if perk.perk.specialCategory.contains("Perception") {
                points += perk.perkLevel
            }
        }
        
        return points
    }
    
    var endurancePoints: Int {
        var points = 0
        for perk in perks {
            if perk.perk.specialCategory.contains("Endurance") {
                points += perk.perkLevel
            }
        }
        
        return points
    }
    
    var charismaPoints: Int {
        var points = 0
        for perk in perks {
            if perk.perk.specialCategory.contains("Charisma") {
                points += perk.perkLevel
            }
        }
        
        return points
    }
    
    var intelligencePoints: Int {
        var points = 0
        for perk in perks {
            if perk.perk.specialCategory.contains("Intelligence") {
                points += perk.perkLevel
            }
        }
        
        return points
    }
    
    var agilityPoints: Int {
        var points = 0
        for perk in perks {
            if perk.perk.specialCategory.contains("Agility") {
                points += perk.perkLevel
            }
        }
        
        return points
    }
    
    var luckPoints: Int {
        var points = 0
        for perk in perks {
            if perk.perk.specialCategory.contains("Luck") {
                points += perk.perkLevel
            }
        }
        
        return points
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
    
    func remove(_ perk: PickedPerk) {
        objectWillChange.send()
        var indexes = IndexSet()
        if let index = perks.firstIndex(of: perk) {
            indexes.insert(index)
        }
        
        perks.remove(atOffsets: indexes)
        save()
    }
}

