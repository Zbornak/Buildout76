//
//  AllPerksView.swift
//  Buildout76
//
//  Created by Mark Strijdom on 12/04/2023.
//

import SwiftUI

struct AllPerksView: View {
    // load array of perk cards from Json file
    let perks: [Perk] = Bundle.main.decode("perks.json")
    
    // the number of columns for the lazy vgrid
    let columns = [GridItem(.adaptive(minimum: 150))]
    
    // the perks array filtered depending on SPECIAL category
    @State private var filteredResults = [Perk]()
    
    var body: some View {
        VStack {
            HStack {
                Button {
                    filteredResults.removeAll()
                    filterPerks(special: "Strength")
                } label: {
                    Image(systemName: "s.square")
                        .font(.largeTitle)
                        .foregroundColor(.green)
                }
                
                Button {
                    filteredResults.removeAll()
                    filterPerks(special: "Perception")
                } label: {
                    Image(systemName: "p.square")
                        .font(.largeTitle)
                        .foregroundColor(.brown)
                }
                
                Button {
                    filteredResults.removeAll()
                    filterPerks(special: "Endurance")
                } label: {
                    Image(systemName: "e.square")
                        .font(.largeTitle)
                        .foregroundColor(.blue)
                }
                
                Button {
                    filteredResults.removeAll()
                    filterPerks(special: "Charisma")
                } label: {
                    Image(systemName: "c.square")
                        .font(.largeTitle)
                        .foregroundColor(.orange)
                }
                
                Button {
                    filteredResults.removeAll()
                    filterPerks(special: "Intelligence")
                } label: {
                    Image(systemName: "i.square")
                        .font(.largeTitle)
                        .foregroundColor(.gray)
                }
                
                Button {
                    filteredResults.removeAll()
                    filterPerks(special: "Agility")
                } label: {
                    Image(systemName: "a.square")
                        .font(.largeTitle)
                        .foregroundColor(.orange.opacity(0.5))
                }
                
                Button {
                    filteredResults.removeAll()
                    filterPerks(special: "Luck")
                } label: {
                    Image(systemName: "l.square")
                        .font(.largeTitle)
                        .foregroundColor(.purple)
                }
            }
            
            if filteredResults.isEmpty {
                Text("Pick a SPECIAL catergory")
                    .padding()
            }
            
            // loop through the filteredResults and show user the perk cards in a grid
            ScrollView {
                LazyVGrid(columns: columns, spacing: 20) {
                    ForEach(filteredResults, id: \.id) { perk in
                        PerkCardView(perk: perk)
                    }
                }
                .padding(.horizontal)
            }
        }
    }
    
    // filter perks according to user's chosen SPECIAL choice
    func filterPerks(special: String) {
        for perk in perks {
            if perk.specialCategory.contains(special) {
                filteredResults.append(perk)
            }
        }
    }
}

struct AllPerksView_Previews: PreviewProvider {
    static var previews: some View {
        AllPerksView()
    }
}