//
//  LegendaryPerkCardSummaryView.swift
//  Buildout76
//
//  Created by Mark Strijdom on 19/04/2023.
//

import SwiftUI

struct LegendaryPerkCardSummaryView: View {
    let legendaryPerk: LegendaryPerk
    
    @State private var perkCardLevel = 1
    
    @EnvironmentObject var pickedLegendaryPerks: PickedLegendaryPerks
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 20)
                .fill()
                .foregroundColor(.blue.opacity(0.3))
            
            RoundedRectangle(cornerRadius: 20)
                .stroke(lineWidth: 2)
                
            VStack(alignment: .center) {
                Text(legendaryPerk.name)
                    .fontWeight(.bold)
                
                Spacer()
            }
            .padding()
        }
        .shadow(radius: 20)
    }
}

struct LegendaryPerkCardSummaryView_Previews: PreviewProvider {
    static var previews: some View {
        LegendaryPerkCardSummaryView(legendaryPerk: LegendaryPerk.example)
            .environmentObject(PickedLegendaryPerks())
    }
}
