//
//  PickedLegendaryPerk.swift
//  Buildout76
//
//  Created by Mark Strijdom on 19/04/2023.
//

import SwiftUI

struct PickedLegendaryPerk: Codable, Identifiable, Equatable {
    var id = UUID()
    let perk: LegendaryPerk
    let perkLevel: Int
    
    func perkLevelStarDisplay() -> String {
        switch perkLevel {
        case 1:
            return "★"
        case 2:
            return "★★"
        case 3:
            return "★★★"
        default:
            return "★★★★"
        }
    }
    
    func remainingStars() -> String {
        let remainingStars = perk.maxLevel - perkLevel
        
        switch remainingStars {
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
    
    static let perkExample = LegendaryPerk(name: "Sizzling Breakfast", description1: "Your breakfast is 10% tastier", description2: "Your breakfast is 20% tastier", description3: "Your breakfast is 30% tastier", description4: "Your breakfast is 50% tastier")
    static let example = PickedLegendaryPerk(perk: perkExample, perkLevel: 3)
}
