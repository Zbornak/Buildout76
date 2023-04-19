//
//  AllLegendaryPerksView.swift
//  Buildout76
//
//  Created by Mark Strijdom on 17/04/2023.
//

import SwiftUI

struct AllLegendaryPerksView: View {
    @EnvironmentObject var legendaryPerks: LegendaryPerks
    @Environment(\.dismiss) var dismiss
    
    let allLegendaryPerks : [LegendaryPerk] = Bundle.main.decode("legendaryPerks.json")
    
    let columns = [GridItem(.adaptive(minimum: 150))]
    
    var body: some View {
        NavigationView {
            VStack {
                ScrollView {
                    LazyVGrid(columns: columns, spacing: 20) {
                        ForEach(allLegendaryPerks, id: \.id) { legendaryPerk in
                            LegendaryPerkCardView(legendaryPerk: legendaryPerk)
                        }
                    }
                    .padding()
                }
            }
            .toolbar {
                Button {
                    dismiss()
                } label: {
                    Image(systemName: "multiply")
                        .fontWeight(.bold)
                        .foregroundColor(.black)
                }
            }
        }
    }
}

struct AllLegendaryPerksView_Previews: PreviewProvider {
    static var previews: some View {
        AllLegendaryPerksView()
            .environmentObject(LegendaryPerks())
    }
}
