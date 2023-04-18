//
//  AllMutationsView.swift
//  Buildout76
//
//  Created by Mark Strijdom on 17/04/2023.
//

import SwiftUI

struct AllMutationsView: View {
    @EnvironmentObject var mutations: Mutations
    
    let allMutations: [Mutation] = Bundle.main.decode("mutations.json")
    
    let columns = [GridItem(.adaptive(minimum: 150))]
    
    var body: some View {
        VStack {
            ScrollView {
                LazyVGrid(columns: columns, spacing: 20) {
                    ForEach(allMutations, id: \.id) { mutation in
                        MutationsCardView(mutation: mutation)
                    }
                }
                .padding()
            }
        }
    }
}

struct AllMutationsView_Previews: PreviewProvider {
    static var previews: some View {
        AllMutationsView()
            .environmentObject(Mutations())
    }
}
