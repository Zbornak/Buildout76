//
//  PerkCardSummaryView.swift
//  Buildout76
//
//  Created by Mark Strijdom on 13/04/2023.
//

import SwiftUI

struct PerkCardSummaryView: View {
    let perk: Perk
    
    @State private var perkCardLevel = 1
    
    @EnvironmentObject var pickedPerks: PickedPerks
    
    var setPerkCardColor: Color {
        if perk.specialCategory == "Strength" {
            return .green.opacity(0.5)
        } else if perk.specialCategory == "Perception" {
            return .brown.opacity(0.5)
        } else if perk.specialCategory == "Endurance" {
            return .blue.opacity(0.5)
        } else if perk.specialCategory == "Charisma" {
            return .orange.opacity(0.5)
        } else if perk.specialCategory == "Intelligence" {
            return .gray.opacity(0.5)
        } else if perk.specialCategory == "Agility" {
            return .orange.opacity(0.2)
        } else {
            return .purple.opacity(0.5)
        }
    }
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 20)
                .fill()
                .foregroundColor(setPerkCardColor)
            
            RoundedRectangle(cornerRadius: 20)
                .stroke(lineWidth: 2)
                
            VStack(alignment: .center) {
                Text(perk.name)
                    .fontWeight(.bold)
                
                Spacer()
                
                if perkCardLevel == 1 {
                    Text(perk.description1)
                } else if perkCardLevel == 2 {
                    Text(perk.description2 ?? "Maximum level reached.")
                } else if perkCardLevel == 3 {
                    Text(perk.description3 ?? "Maximum level reached.")
                } else if perkCardLevel == 4 {
                    Text(perk.description4 ?? "Maximum level reached.")
                } else {
                    Text(perk.description5 ?? "Maximum level reached.")
                }
                
                Spacer()
                
                Text("★")
            }
            .padding()
        }
        .shadow(radius: 20)
    }
}

struct PerkCardSummaryView_Previews: PreviewProvider {
    static var previews: some View {
        PerkCardSummaryView(perk: Perk.example)
            .environmentObject(PickedPerks())
    }
}

