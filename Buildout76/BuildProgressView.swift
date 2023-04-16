//
//  BuildProgressView.swift
//  Buildout76
//
//  Created by Mark Strijdom on 12/04/2023.
//

import SwiftUI

struct BuildProgressView: View {
    @EnvironmentObject var pickedPerks: PickedPerks
    @EnvironmentObject var builds: Builds
    
    @State private var buildName = ""
    @State var build: Build
    @State private var buildSaved = false
    
    var sortedPickedPerks: [PickedPerk] {
        pickedPerks.perks.sorted { $0.perk.name < $1.perk.name }
    }
    
    var body: some View {
        NavigationView {
            Form {
                TextField("Enter build name", text: $buildName)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding(.horizontal)
            
                Section {
                    ForEach(sortedPickedPerks) { perk in
                        NavigationLink {
                            ZStack {
                                PerkCardSummaryView(perk: perk.perk)
                                    .padding()
                                    
                                VStack {
                                    selectDescription(of: perk)
                                        
                                    Text("\(perk.perkLevel)/\(perk.perk.maxLevel)")
                                        .padding(.bottom)
                                }
                                .padding()
                            }
                        } label: {
                            HStack {
                                Text(perk.perk.name)
                                Text("\(perk.perkLevel)")
                            }
                        }
                        .swipeActions {
                            Button(role: .destructive) {
                                pickedPerks.removePerk(perk)
                            } label: {
                                Image(systemName: "trash")
                            }
                        }
                    }
                } header: {
                    Text("perks")
                }
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button {
                        let build = Build(name: buildName, perks: pickedPerks.perks)
                        pickedPerks.objectWillChange.send()
                        builds.objectWillChange.send()
                        builds.add(build)
                        pickedPerks.perks.removeAll()
                        builds.save()
                        pickedPerks.save()
                        buildName = ""
                        buildSaved = true
                    } label: {
                        Text("Save")
                    }
                }
            }
            .navigationTitle("⚛︎ Build in Progress")
            .alert("Build saved!", isPresented: $buildSaved) {
                Button("OK", role: .cancel) { }
            }
        }
    }
    
    func selectDescription(of perk: PickedPerk) -> Text {
        switch perk.perkLevel {
        case 1:
            return Text(perk.perk.description1)
        case 2:
            return Text(perk.perk.description2 ?? "Unknown description.")
        case 3:
            return Text(perk.perk.description3 ?? "Unknown description.")
        case 4:
            return Text(perk.perk.description4 ?? "Unknown description.")
        default:
            return Text(perk.perk.description5 ?? "Unknown description.")
        }
    }
}

struct BuildProgressView_Previews: PreviewProvider {
    static var previews: some View {
        BuildProgressView(build: Build.example)
            .environmentObject(PickedPerks())
            .environmentObject(Builds())
    }
}
