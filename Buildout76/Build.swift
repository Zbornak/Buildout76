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
    var strengthPointsRemaining = 15
    var perceptionPointsRemaining = 15
    var endurancePointsRemaining = 15
    var charismaPointsRemaining = 15
    var intelligencePointsRemaining = 15
    var agilityPointsRemaining = 15
    var luckPointsRemaining = 15
    
    static let allPerks: [Perk] = Bundle.main.decode("perks.json")
    static let pickedPerk = PickedPerk(perk: allPerks[0], perkLevel: 1, isSelected: false)
    static let example = Build(name: "Tha Killah", perks: [pickedPerk])
}
