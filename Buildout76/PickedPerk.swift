//
//  PickedPerk.swift
//  Buildout76
//
//  Created by Mark Strijdom on 12/04/2023.
//

import SwiftUI

struct PickedPerk: Codable, Identifiable, Equatable {
    var id = UUID()
    let perk: Perk
    let perkLevel: Int
    
    func perkLevelStarDisplay() -> String {
        switch perkLevel {
        case 1:
            return "★"
        case 2:
            return "★★"
        case 3:
            return "★★★"
        case 4:
            return "★★★★"
        default:
            return "★★★★★"
        }
    }
    
    func remainingStars() -> String {
        let remainingStars = perk.maxLevel - perkLevel
        
        switch remainingStars {
        case 4:
            return "☆☆☆☆"
        case 3:
            return "☆☆☆"
        case 2:
            return "☆☆"
        case 1:
            return "☆"
        default:
            return ""
        }
    }
    
    static let perkExample = Perk(id: "super-dingus", name: "Super Dingus", specialCategory: "Strength", levelAvailable: 1, maxLevel: 3, description1: "Your dingus is now 10% better.", description2: "Your dingus is now 20% better.", description3: "Your dingus is now 30% better.", description4: "Your dingus is now 40% better.", description5: "Your dingus is now 50% better.")
    static let example = PickedPerk(id: UUID(), perk: perkExample, perkLevel: 1)
}
