//
//  PickedPerks.swift
//  Buildout76
//
//  Created by Mark Strijdom on 12/04/2023.
//

import Foundation

class PickedPerks: ObservableObject {
    var pickedPerks: [PickedPerk]
    
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
    
    func add(_ pickedPerk: PickedPerk) {
        objectWillChange.send()
        pickedPerks.append(pickedPerk)
        save()
    }
    
    func save() {
        if let encodedData = try? JSONEncoder().encode(pickedPerks) {
            UserDefaults.standard.set(encodedData, forKey: saveKey)
        }
    }
}

