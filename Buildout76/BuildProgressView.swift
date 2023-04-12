//
//  BuildProgressView.swift
//  Buildout76
//
//  Created by Mark Strijdom on 12/04/2023.
//

import SwiftUI

struct BuildProgressView: View {
    @EnvironmentObject var pickedPerks: PickedPerks
    
    @State private var buildName = ""
    
    var body: some View {
        Form {
            Section {
                TextField("Enter build name", text: $buildName)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding(.horizontal)
            } header: {
                Text("build name")
            }
            
            Section {
                ForEach(pickedPerks, id: \.id) { pickedPerk in
                    HStack {
                        if pickedPerk.perk.specialCategory.contains("Strength") {
                            NavigationLink {
                                PerkCardView(perk: pickedPerk.perk)
                            } label: {
                                Text(pickedPerk.perk.name)
                                Text("\(pickedPerk.perkLevel)")
                            }
                        }
                    }
                }
            } header: {
                Text("strength perks")
            }
        }
    }
}

struct BuildProgressView_Previews: PreviewProvider {
    static var previews: some View {
        BuildProgressView()
            .environmentObject(PickedPerks())
    }
}
