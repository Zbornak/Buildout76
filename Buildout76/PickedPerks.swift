//
//  PickedPerks.swift
//  Buildout76
//
//  Created by Mark Strijdom on 12/04/2023.
//

import SwiftUI

class PickedPerks: ObservableObject {
    @Published var perks: [PickedPerk]
    
    private let saveKey = "PickedPerks"
    
    init() {
        if let data = UserDefaults.standard.data(forKey: saveKey) {
            if let decodedData = try? JSONDecoder().decode([PickedPerk].self, from: data) {
                perks = decodedData
                return
            }
        }
        
        perks = []
    }
    
    func add(_ pickedPerk: PickedPerk) {
        objectWillChange.send()
        perks.append(pickedPerk)
        save()
    }
    
    func remove(_ pickedPerk: PickedPerk) {
        objectWillChange.send()
        if let index = perks.firstIndex(of: pickedPerk) {
            perks.remove(at: index)
        }
        save()
    }
    
    func save() {
        if let encodedData = try? JSONEncoder().encode(perks) {
            UserDefaults.standard.set(encodedData, forKey: saveKey)
        }
    }
}

