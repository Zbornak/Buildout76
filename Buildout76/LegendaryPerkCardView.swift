//
//  LegendaryPerkCardView.swift
//  Buildout76
//
//  Created by Mark Strijdom on 18/04/2023.
//

import SwiftUI

struct LegendaryPerkCardView: View {
    let legendaryPerk: LegendaryPerk
    
    @State private var legendaryPerkCardLevel = 1
    
    @EnvironmentObject var legendaryPerks: LegendaryPerks
    
    
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 20)
                .fill()
                .foregroundColor(.gray)
            
            RoundedRectangle(cornerRadius: 20)
                .stroke(lineWidth: 1)
                
            VStack(alignment: .center) {
                Stepper("Lvl \(legendaryPerkCardLevel)", value: $legendaryPerkCardLevel, in: 1...4)
                Text(legendaryPerk.name)
                    .fontWeight(.bold)
                
                Spacer()
                
                if legendaryPerkCardLevel == 1 {
                    Text(legendaryPerk.description1)
                } else if legendaryPerkCardLevel == 2 {
                    Text(legendaryPerk.description2)
                } else if legendaryPerkCardLevel == 3 {
                    Text(legendaryPerk.description3)
                } else {
                    Text(legendaryPerk.description4)
                }
                
                Spacer()
                
                HStack {
                    Spacer()
                    Button("+") {
                        withAnimation {
                            // add chosen legendary perk to legendaryperks array
                        }
                    }
                    .buttonStyle(.borderedProminent)
                }
            }
            .padding()
        }
        .shadow(radius: 20)
    }
}

struct LegendaryPerkCardView_Previews: PreviewProvider {
    static var previews: some View {
        LegendaryPerkCardView(legendaryPerk: LegendaryPerk.example)
            .environmentObject(LegendaryPerks())
    }
}
