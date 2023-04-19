//
//  PickedLegendaryPerks.swift
//  Buildout76
//
//  Created by Mark Strijdom on 18/04/2023.
//

import SwiftUI

class PickedLegendaryPerks: ObservableObject {
    @Published var pickedLegendaryPerks: [PickedLegendaryPerk]
    
    private let saveKey = "PickedLegendaryPerks"
    
    init() {
        if let data = UserDefaults.standard.data(forKey: saveKey) {
            if let decodedData = try? JSONDecoder().decode([PickedLegendaryPerk].self, from: data) {
                pickedLegendaryPerks = decodedData
                return
            }
        }
        
        pickedLegendaryPerks = []
    }
    
    func add(_ pickedLegendaryPerk: PickedLegendaryPerk) {
        objectWillChange.send()
        pickedLegendaryPerks.append(pickedLegendaryPerk)
        save()
    }
    
    func save() {
        if let encodedData = try? JSONEncoder().encode(pickedLegendaryPerks) {
            UserDefaults.standard.set(encodedData, forKey: saveKey)
        }
    }
    
    func remove(_ pickedLegendaryPerk: PickedLegendaryPerk) {
        objectWillChange.send()
        var indexes = IndexSet()
        if let index = pickedLegendaryPerks.firstIndex(of: pickedLegendaryPerk) {
            indexes.insert(index)
        }
        
        pickedLegendaryPerks.remove(atOffsets: indexes)
        save()
    }
}
