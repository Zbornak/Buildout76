//
//  Perk.swift
//  Buildout76
//
//  Created by Mark Strijdom on 04/04/2023.
//

import SwiftUI

struct Perk: Codable, Identifiable, Equatable {
    let id: String
    let name: String
    let specialCategory: String
    let levelAvailable: Int
    let maxLevel: Int
    let description1: String
    let description2: String?
    let description3: String?
    let description4: String?
    let description5: String?
    
    static let example = Perk(id: "super-dingus", name: "Super Dingus", specialCategory: "Strength", levelAvailable: 1, maxLevel: 3, description1: "Your dingus is now 10% better.", description2: "Your dingus is now 20% better.", description3: "Your dingus is now 30% better.", description4: "Your dingus is now 40% better.", description5: "Your dingus is now 50% better.")
}
