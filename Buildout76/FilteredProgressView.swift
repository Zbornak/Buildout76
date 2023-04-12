//
//  FilteredProgressView.swift
//  Buildout76
//
//  Created by Mark Strijdom on 12/04/2023.
//

import SwiftUI

struct FilteredProgressView: View {
    enum FilterType {
        case strength, perception, endurance, charisma, intelligence, agility, luck
    }
    
    let filter: FilterType
    
    var header: String {
        switch filter {
        case .strength:
            return "strength perks"
        case .perception:
            return "perception perks"
        case .endurance:
            return "endurance perks"
        case .charisma:
            return "charisma perks"
        case .intelligence:
            return "intelligence perks"
        case .agility:
            return "agility perks"
        case .luck:
            return "luck perks"
        }
    }
    
    var body: some View {
        Section {
            
        } header: {
            Text(header)
        }
    }
}

struct FilteredProgressView_Previews: PreviewProvider {
    static var previews: some View {
        FilteredProgressView(filter: .strength)
    }
}
