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
    
    static let allPerks: [Perk] = Bundle.main.decode("perks.json")
    static let example = PickedPerk(id: UUID(), perk: allPerks[0], perkLevel: 1)
}
