//
//  Mutation.swift
//  Buildout76
//
//  Created by Mark Strijdom on 17/04/2023.
//

import SwiftUI

struct Mutation: Codable, Identifiable, Equatable {
    let id: String
    let name: String
    let descriptionPositive: String
    let descriptionNegative: String
    
    static let example = Mutation(id: "egg-head", name: "Egg Head", descriptionPositive: "INT +6", descriptionNegative: "STR -3, END -3")
}
