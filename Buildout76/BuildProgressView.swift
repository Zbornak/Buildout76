//
//  BuildProgressView.swift
//  Buildout76
//
//  Created by Mark Strijdom on 12/04/2023.
//

import SwiftUI

struct BuildProgressView: View {
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
            
            FilteredProgressView(filter: .strength)
            FilteredProgressView(filter: .perception)
            FilteredProgressView(filter: .endurance)
            FilteredProgressView(filter: .charisma)
            FilteredProgressView(filter: .intelligence)
            FilteredProgressView(filter: .agility)
            FilteredProgressView(filter: .luck)
        }
    }
}

struct BuildProgressView_Previews: PreviewProvider {
    static var previews: some View {
        BuildProgressView()
    }
}
