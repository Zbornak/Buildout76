//
//  Build.swift
//  Buildout76
//
//  Created by Mark Strijdom on 07/04/2023.
//

import SwiftUI

struct Build: Codable, Identifiable {
    var id = UUID()
    let name: String
    var perks: [PickedPerk]
    
    var remainingStrengthPoints: Int {
        var pointsRemaining = 15
        for perk in perks {
            if perk.perk.specialCategory.contains("Strength") {
                pointsRemaining -= perk.perkLevel
            }
        }
        
        return pointsRemaining
    }
    
    static let allPerks: [Perk] = Bundle.main.decode("perks.json")
    static let pickedPerk = PickedPerk(perk: allPerks[0], perkLevel: 1)
    static let example = Build(name: "Tha Killah", perks: [pickedPerk])
}
