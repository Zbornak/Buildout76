//
//  EquipmentMainView.swift
//  Buildout76
//
//  Created by Mark Strijdom on 20/04/2023.
//

import SwiftUI

struct EquipmentMainView: View {
    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    VStack {
                        Text("Ranged")
                            .fontWeight(.bold)
                        Button {
                            // ranged
                        } label: {
                            Text("🔫")
                                .font(.largeTitle)
                        }
                    }
                    
                    VStack {
                        Text("Underamor")
                            .fontWeight(.bold)
                        Button {
                            // underarmor
                        } label: {
                            Text("👙")
                                .font(.largeTitle)
                        }
                    }
                    .padding(.horizontal)
                    
                    VStack {
                        Text("Melee")
                            .fontWeight(.bold)
                        Button {
                            // melee
                        } label: {
                            Text("🦴")
                                .font(.largeTitle)
                        }
                    }
                }
                
                VStack {
                    Text("Armor")
                        .fontWeight(.bold)
                    Button {
                        // helmet
                    } label: {
                        Text("👨")
                            .font(.largeTitle)
                    }
                    HStack {
                        Button {
                            // left arm
                        } label: {
                            Text("💪")
                                .font(.largeTitle)
                        }
                        Button {
                            // torso
                        } label: {
                            Text("👕")
                                .font(.system(size: 50))
                        }
                        Button {
                            // right arm
                        } label: {
                            Text("💪")
                                .font(.largeTitle)
                                .rotation3DEffect(.degrees(180), axis: (x: 0, y: 1, z: 0))
                        }
                    }
                    HStack {
                        Button {
                            // left leg
                        } label: {
                            Text("🦵")
                                .rotation3DEffect(.degrees(180), axis: (x: 0, y: 1, z: 0))
                                .font(.system(size: 50))
                        }
                        Button {
                            // right leg
                        } label: {
                            Text("🦵")
                                .font(.system(size: 50))
                        }
                    }
                }
                .padding()
                
                VStack {
                    Text("Power Armor")
                        .fontWeight(.bold)
                    Button {
                        // helmet
                    } label: {
                        Text("🤖")
                            .font(.largeTitle)
                    }
                    HStack {
                        Button {
                            // left arm
                        } label: {
                            Text("🦾")
                                .font(.largeTitle)
                        }
                        Button {
                            // torso
                        } label: {
                            Text("📺")
                                .font(.system(size: 50))
                        }
                        Button {
                            // right arm
                        } label: {
                            Text("🦾")
                                .font(.largeTitle)
                                .rotation3DEffect(.degrees(180), axis: (x: 0, y: 1, z: 0))
                        }
                    }
                    HStack {
                        Button {
                            // left leg
                        } label: {
                            Text("🦿")
                                .rotation3DEffect(.degrees(180), axis: (x: 0, y: 1, z: 0))
                                .font(.system(size: 50))
                        }
                        Button {
                            // right leg
                        } label: {
                            Text("🦿")
                                .font(.system(size: 50))
                        }
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
    }
}
