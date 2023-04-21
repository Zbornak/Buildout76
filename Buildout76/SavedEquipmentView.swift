//
//  SavedEquipmentView.swift
//  Buildout76
//
//  Created by Mark Strijdom on 21/04/2023.
//

import SwiftUI

struct SavedEquipmentView: View {
    @EnvironmentObject var equipment: Equipment
    
    var body: some View {
        VStack {
            HStack {
                VStack {
                    Text(equipment.selectedRangedWeapon)
                        .fontWeight(.bold)
                    Text("🔫")
                        .font(.largeTitle)
                    Text(equipment.selectedRangedPrefix1)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    Text(equipment.selectedRangedPrefix2)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    Text(equipment.selectedRangedPrefix3)
                        .frame(maxWidth: .infinity, alignment: .leading)
                }
                .padding(.horizontal)
                
                VStack {
                    Text(equipment.selectedMeleeWeapon)
                        .fontWeight(.bold)
                    Text("🦴")
                        .font(.largeTitle)
                    Text(equipment.selectedMeleePrefix1)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    Text(equipment.selectedMeleePrefix2)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    Text(equipment.selectedMeleePrefix3)
                        .frame(maxWidth: .infinity, alignment: .leading)
                }
                .padding(.horizontal)
            }
            
            VStack {
                Text("Underamor")
                    .fontWeight(.bold)
                Text("👙")
                    .font(.largeTitle)
                Text(equipment.selectedUnderarmor)
                    .padding(.bottom)
                
                Text("Armor")
                    .fontWeight(.bold)
                Text("👨")
                    .font(.largeTitle)
                Text("💪")
                    .font(.largeTitle)
                Text("👕")
                    .font(.system(size: 50))
                Text("💪")
                    .font(.largeTitle)
                    .rotation3DEffect(.degrees(180), axis: (x: 0, y: 1, z: 0))
                Text("🦵")
                    .rotation3DEffect(.degrees(180), axis: (x: 0, y: 1, z: 0))
                    .font(.system(size: 50))
                Text("🦵")
                    .font(.system(size: 50))
            }
            .padding()
            
            VStack {
                Text("Power Armor")
                    .fontWeight(.bold)
                Text("🤖")
                    .font(.largeTitle)
                
                HStack {
                    Text("🦾")
                        .font(.largeTitle)
                    Text("📺")
                        .font(.system(size: 50))
                    Text("🦾")
                        .font(.largeTitle)
                        .rotation3DEffect(.degrees(180), axis: (x: 0, y: 1, z: 0))
                }
                HStack {
                    Text("🦿")
                        .rotation3DEffect(.degrees(180), axis: (x: 0, y: 1, z: 0))
                        .font(.system(size: 50))
                    Text("🦿")
                        .font(.system(size: 50))
                }
            }
            .padding()
        }
    }
}

struct SavedEquipmentView_Previews: PreviewProvider {
    static var previews: some View {
        SavedEquipmentView()
            .environmentObject(Equipment())
    }
}
