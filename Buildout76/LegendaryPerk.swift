//
//  LegendaryPerk.swift
//  Buildout76
//
//  Created by Mark Strijdom on 17/04/2023.
//

import SwiftUI

struct LegendaryPerk: Codable, Identifiable, Equatable {
    var id = UUID()
    let name: String
    var maxLevel = 4
    let description1: String
    let description2: String
    let description3: String
    let description4: String
    
    enum CodingKeys: String, CodingKey {
             case name, description1, description2, description3, description4
         }
    
    static let example = LegendaryPerk(name: "Sizzling Style", description1: "+50 Fire Damage Resist when wearing a matching set of armor.", description2: "+100 Fire Damage Resist when wearing a matching set of armor.", description3: "+150 Fire Damage Resist when wearing a matching set of armor.", description4: "+200 Fire Damage Resist when wearing a matching set of armor.")
}
