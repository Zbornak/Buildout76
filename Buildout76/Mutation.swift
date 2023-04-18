//
//  Mutation.swift
//  Buildout76
//
//  Created by Mark Strijdom on 17/04/2023.
//

import SwiftUI

struct Mutation: Codable, Identifiable, Equatable {
    var id = UUID()
    let name: String
    let descriptionPositive: String
    let descriptionNegative: String
    
    private enum CodingKeys : String, CodingKey { case name, descriptionPositive, descriptionNegative }
    
    static let example = Mutation(name: "Egg Head", descriptionPositive: "INT +6", descriptionNegative: "STR -3, END -3")
}
