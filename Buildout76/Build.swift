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
    
    static let allPerks: [PickedPerk] = Bundle.main.decode("perks.json")
    static let example = Build(name: "Tha Killah", perks: allPerks)
}
