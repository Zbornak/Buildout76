//
//  AllPerksView.swift
//  Buildout76
//
//  Created by Mark Strijdom on 12/04/2023.
//

import Foundation
import SwiftUI

struct AllPerksView: View {
    @EnvironmentObject var pickedPerks: PickedPerks
    @EnvironmentObject var pickedLegendaryPerks: PickedLegendaryPerks
    @EnvironmentObject var mutations: Mutations
    
    // load array of perk cards from Json file
    let perks: [Perk] = Bundle.main.decode("perks.json")
    
    // the number of columns for the lazy vgrid
    let columns = [GridItem(.adaptive(minimum: 150))]
    
    // the perks array filtered depending on SPECIAL category
    @State private var filteredResults = [Perk]()
    
    let build: Build
    
    @State private var legendaryPerksSheetShowing = false
    @State private var mutationsSheetShowing = false
    
    var body: some View {
        VStack {
            HStack {
                VStack {
                    Text("\(pickedPerks.strengthPoints)")
                    Button {
                        filteredResults.removeAll()
                        filterPerks(special: "Strength")
                    } label: {
                        Image(systemName: "s.square")
                            .font(.largeTitle)
                            .foregroundColor(.green)
                    }
                }
                
                VStack {
                    Text("\(pickedPerks.perceptionPoints)")
                    Button {
                        filteredResults.removeAll()
                        filterPerks(special: "Perception")
                    } label: {
                        Image(systemName: "p.square")
                            .font(.largeTitle)
                            .foregroundColor(.brown)
                    }
                }
                
                VStack {
                    Text("\(pickedPerks.endurancePoints)")
                    Button {
                        filteredResults.removeAll()
                        filterPerks(special: "Endurance")
                    } label: {
                        Image(systemName: "e.square")
                            .font(.largeTitle)
                            .foregroundColor(.blue)
                    }
                }
                
                VStack {
                    Text("\(pickedPerks.charismaPoints)")
                    Button {
                        filteredResults.removeAll()
                        filterPerks(special: "Charisma")
                    } label: {
                        Image(systemName: "c.square")
                            .font(.largeTitle)
                            .foregroundColor(.orange)
                    }
                }
                
                VStack {
                    Text("\(pickedPerks.intelligencePoints)")
                    Button {
                        filteredResults.removeAll()
                        filterPerks(special: "Intelligence")
                    } label: {
                        Image(systemName: "i.square")
                            .font(.largeTitle)
                            .foregroundColor(.gray)
                    }
                }
                
                VStack {
                    Text("\(pickedPerks.agilityPoints)")
                    Button {
                        filteredResults.removeAll()
                        filterPerks(special: "Agility")
                    } label: {
                        Image(systemName: "a.square")
                            .font(.largeTitle)
                            .foregroundColor(.orange.opacity(0.5))
                    }
                }
                
                VStack {
                    Text("\(pickedPerks.luckPoints)")
                    Button {
                        filteredResults.removeAll()
                        filterPerks(special: "Luck")
                    } label: {
                        Image(systemName: "l.square")
                            .font(.largeTitle)
                            .foregroundColor(.purple)
                    }
                }
            }
            
            if filteredResults.isEmpty {
                VStack {
                    Text("↑")
                    HStack {
                        Image(systemName: "gearshape.fill")
                        Text("Pick a SPECIAL category")
                    }
                }
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
            
            HStack {
                Button {
                    legendaryPerksSheetShowing = true
                } label: {
                    Label("Legendary", systemImage: "plus.circle")
                }
                
                Spacer()
                
                Text("\(pickedPerks.totalPerkPoints)")
                    .fontWeight(.bold)
                    .padding(10)
                    .overlay(
                            RoundedRectangle(cornerRadius: 25)
                                .stroke(.black, lineWidth: 1)
                        )
                
                Spacer()
                
                Button {
                    mutationsSheetShowing = true
                } label: {
                    Label("Mutations", systemImage: "plus.circle")
                }
            }
            .padding()
        }
        .sheet(isPresented: $legendaryPerksSheetShowing) {
            AllLegendaryPerksView()
        }
        .sheet(isPresented: $mutationsSheetShowing) {
            AllMutationsView()
        }
    }
    
    // filter perks according to user's chosen SPECIAL choice
    func filterPerks(special: String) {
        for perk in perks {
            if perk.specialCategory.contains(special) {
                filteredResults.append(perk)
            }
        }
        
        filteredResults = filteredResults.sorted(by: { perk, otherPerk in
            perk.name < otherPerk.name
        })
    }
}

struct AllPerksView_Previews: PreviewProvider {
    static var previews: some View {
        AllPerksView(build: Build.example)
            .environmentObject(PickedPerks())
            .environmentObject(PickedLegendaryPerks())
            .environmentObject(Mutations())
    }
}
