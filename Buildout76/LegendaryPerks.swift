//
//  LegendaryPerks.swift
//  Buildout76
//
//  Created by Mark Strijdom on 18/04/2023.
//

import SwiftUI

class LegendaryPerks: ObservableObject {
    @Published var legendaryPerks: [LegendaryPerk]
    
    private let saveKey = "LegendaryPerks"
    
    init() {
        if let data = UserDefaults.standard.data(forKey: saveKey) {
            if let decodedData = try? JSONDecoder().decode([LegendaryPerk].self, from: data) {
                legendaryPerks = decodedData
                return
            }
        }
        
        legendaryPerks = []
    }
    
    func add(_ legendaryPerk: LegendaryPerk) {
        objectWillChange.send()
        legendaryPerks.append(legendaryPerk)
        save()
    }
    
    func save() {
        if let encodedData = try? JSONEncoder().encode(legendaryPerks) {
            UserDefaults.standard.set(encodedData, forKey: saveKey)
        }
    }
    
    func removePerk(_ legendaryPerk: LegendaryPerk) {
        objectWillChange.send()
        var indexes = IndexSet()
        if let index = legendaryPerks.firstIndex(of: legendaryPerk) {
            indexes.insert(index)
        }
        
        legendaryPerks.remove(atOffsets: indexes)
        save()
    }
}
