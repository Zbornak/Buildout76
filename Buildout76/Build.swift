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
    var mutations: [Mutation]
    
    static let pickedPerk = PickedPerk(perk: Perk(id: "super-dingus", name: "Super Dingus", specialCategory: "Strength", levelAvailable: 1, maxLevel: 3, description1: "Your dingus is now 10% better.", description2: "Your dingus is now 20% better.", description3: "Your dingus is now 30% better.", description4: "Your dingus is now 40% better.", description5: "Your dingus is now 50% better."), perkLevel: 1)
    static let mutation = Mutation(id: "boiling-blood", name: "Boiling Blood", descriptionPositive: "Your blood boils for extra damage", descriptionNegative: "Weakness to cryo damage")
    static let example = Build(name: "Tha Killah", perks: [pickedPerk], mutations: [mutation])
}
