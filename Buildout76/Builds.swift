//
//  Builds.swift
//  Buildout76
//
//  Created by Mark Strijdom on 07/04/2023.
//

import Foundation

class Builds: ObservableObject {
    var savedBuilds: [Build]
    
    private let saveKey = "Builds"
    
    init() {
        if let data = UserDefaults.standard.data(forKey: saveKey) {
            if let decodedData = try? JSONDecoder().decode([Build].self, from: data) {
                savedBuilds = decodedData
                return
            }
        }
        
        savedBuilds = []
    }
    
    func add(_ build: Build) {
        objectWillChange.send()
        savedBuilds.append(build)
        save()
    }
    
    func save() {
        if let encodedData = try? JSONEncoder().encode(savedBuilds) {
            UserDefaults.standard.set(encodedData, forKey: saveKey)
        }
    }
}
