//
//  BuildProgressView.swift
//  Buildout76
//
//  Created by Mark Strijdom on 12/04/2023.
//

import SwiftUI

struct BuildProgressView: View {
    @Binding var pickedPerks: [PickedPerk]
    
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
                Text("")
            } header: {
                Text("strength perks")
            }
            
            Section {
                Text("None selected")
            } header: {
                Text("perception perks")
            }
            
            Section {
                Text("None selected")
            } header: {
                Text("endurance perks")
            }
            
            Section {
                Text("None selected")
            } header: {
                Text("charisma perks")
            }
            
            Section {
                Text("None selected")
            } header: {
                Text("intelligence perks")
            }
            
            Section {
                Text("None selected")
            } header: {
                Text("agility perks")
            }
            
            Section {
                Text("None selected")
            } header: {
                Text("luck perks")
            }
        }
    }
}

struct BuildProgressView_Previews: PreviewProvider {
    static var previews: some View {
        BuildProgressView(pickedPerks: .constant([PickedPerk.example]))
    }
}
