//
//  EquipmentMainView.swift
//  Buildout76
//
//  Created by Mark Strijdom on 20/04/2023.
//

import SwiftUI

struct EquipmentMainView: View {
    @EnvironmentObject var equipment: Equipment
    
    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    VStack {
                        Text("Ranged")
                            .fontWeight(.bold)
                        Text("🔫")
                            .font(.largeTitle)
                    }
                    .padding(.horizontal)
                    
                    VStack {
                        Text("Melee")
                            .fontWeight(.bold)
                        Text("🦴")
                            .font(.largeTitle)
                    }
                    .padding(.horizontal)
                }
                
                VStack {
                    Text("Underamor")
                        .fontWeight(.bold)
                    Text("👙")
                        .font(.largeTitle)
                        .padding(.bottom)
                            
                    Text("Armor")
                        .fontWeight(.bold)
                    Text("👨")
                        .font(.largeTitle)
                    
                    HStack {
                        Text("💪")
                            .font(.largeTitle)
                        Text("👕")
                            .font(.system(size: 50))
                        Text("💪")
                            .font(.largeTitle)
                            .rotation3DEffect(.degrees(180), axis: (x: 0, y: 1, z: 0))
                    }
                    HStack {
                        Text("🦵")
                            .rotation3DEffect(.degrees(180), axis: (x: 0, y: 1, z: 0))
                            .font(.system(size: 50))
                        Text("🦵")
                            .font(.system(size: 50))
                    }
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
            .navigationTitle("⚛︎ Equipment")
        }
    }
}

struct EquipmentMainView_Previews: PreviewProvider {
    static var previews: some View {
        EquipmentMainView()
            .environmentObject(Equipment())
    }
}
