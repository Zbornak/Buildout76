//
//  Mutations.swift
//  Buildout76
//
//  Created by Mark Strijdom on 18/04/2023.
//

import SwiftUI

class Mutations: ObservableObject {
    @Published var mutations: [Mutation]
    
    private let saveKey = "Mutations"
    
    init() {
        if let data = UserDefaults.standard.data(forKey: saveKey) {
            if let decodedData = try? JSONDecoder().decode([Mutation].self, from: data) {
                mutations = decodedData
                return
            }
        }
        
        mutations = []
    }
    
    func add(_ mutation: Mutation) {
        objectWillChange.send()
        mutations.append(mutation)
        save()
    }
    
    func save() {
        if let encodedData = try? JSONEncoder().encode(mutations) {
            UserDefaults.standard.set(encodedData, forKey: saveKey)
        }
    }
    
    func remove(_ mutation: Mutation) {
        objectWillChange.send()
        var indexes = IndexSet()
        if let index = mutations.firstIndex(of: mutation) {
            indexes.insert(index)
        }
        
        mutations.remove(atOffsets: indexes)
        save()
    }
}
