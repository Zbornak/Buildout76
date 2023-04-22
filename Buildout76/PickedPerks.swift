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
            
            if perk.perk.id == "night-eyes" {
                points -= 1
            }
            
            if perk.perk.id == "professional-drinker" {
                points -= 2
            }
            
            if perk.perk.id == "field-surgeon" {
                points -= 1
            }
            
            if perk.perk.id == "lifegiver" {
                switch perk.perkLevel {
                case 1:
                    points -= 1
                default:
                    points -= 1
                }
            }
            
            if perk.perk.id == "party-boy-girl" {
                switch perk.perkLevel {
                case 1:
                    points -= 1
                default:
                    points -= 1
                }
            }
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
            
            if perk.perk.id == "night-eyes" {
                points += 1
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
            
            if perk.perk.id == "professional-drinker" {
                points += 2
            }
            
            if perk.perk.id == "lifegiver" {
                switch perk.perkLevel {
                case 1:
                    points += 1
                default:
                    points += 1
                }
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
            
            if perk.perk.id == "field-surgeon" {
                points += 1
            }
            
            if perk.perk.id == "party-boy-girl" {
                switch perk.perkLevel {
                case 1:
                    points += 1
                default:
                    points += 1
                }
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

