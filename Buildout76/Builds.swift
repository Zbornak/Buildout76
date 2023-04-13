//
//  Builds.swift
//  Buildout76
//
//  Created by Mark Strijdom on 07/04/2023.
//

import SwiftUI

class Builds: ObservableObject {
    @Published var builds: [Build]
    
    private let saveKey = "Builds"
    
    init() {
        if let data = UserDefaults.standard.data(forKey: saveKey) {
            if let decodedData = try? JSONDecoder().decode([Build].self, from: data) {
                builds = decodedData
                return
            }
        }
        
        builds = []
    }
    
    func add(_ build: Build) {
        objectWillChange.send()
        builds.append(build)
        save()
    }
    
    func save() {
        if let encodedData = try? JSONEncoder().encode(builds) {
            UserDefaults.standard.set(encodedData, forKey: saveKey)
        }
    }
}
