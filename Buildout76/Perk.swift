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
    
    static let allPerks: [Perk] = Bundle.main.decode("perks.json")
    static let example = allPerks[0]
}
