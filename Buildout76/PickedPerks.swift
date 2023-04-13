//
//  PickedPerks.swift
//  Buildout76
//
//  Created by Mark Strijdom on 12/04/2023.
//

import SwiftUI

class PickedPerks: ObservableObject {
    @Published var pickedPerks: [PickedPerk]
    
    private let saveKey = "PickedPerks"
    
    init() {
        if let data = UserDefaults.standard.data(forKey: saveKey) {
            if let decodedData = try? JSONDecoder().decode([PickedPerk].self, from: data) {
                pickedPerks = decodedData
                return
            }
        }
        
        pickedPerks = []
    }
    
    func contains(_ pickedPerk: PickedPerk) -> Bool {
        pickedPerks.contains(where: { $0.id == pickedPerk.id })
    }
    
    func add(_ pickedPerk: PickedPerk) {
        objectWillChange.send()
        pickedPerks.append(pickedPerk)
        save()
    }
    
    func remove(_ pickedPerk: PickedPerk) {
        objectWillChange.send()
        if let index = pickedPerks.firstIndex(of: pickedPerk) {
            pickedPerks.remove(at: index)
        }
        save()
    }
    
    func save() {
        if let encodedData = try? JSONEncoder().encode(pickedPerks) {
            UserDefaults.standard.set(encodedData, forKey: saveKey)
        }
    }
}

