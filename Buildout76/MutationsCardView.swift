//
//  MutationsCardView.swift
//  Buildout76
//
//  Created by Mark Strijdom on 18/04/2023.
//

import SwiftUI

struct MutationsCardView: View {
    let mutation: Mutation
    
    @EnvironmentObject var mutations: Mutations
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 20)
                .fill()
                .foregroundColor(.gray)
            
            RoundedRectangle(cornerRadius: 20)
                .stroke(lineWidth: 1)
                
            VStack(alignment: .center) {
                Text(mutation.name)
                    .fontWeight(.bold)
                
                Spacer()
                
                Text(mutation.descriptionPositive)
                    .padding(.bottom)
                
                Text(mutation.descriptionNegative)
                
                
                Spacer()
                
                HStack {
                    Spacer()
                    Button("+") {
                        withAnimation {
                            // add chosen mutation to mutations array
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

struct MutationsCardView_Previews: PreviewProvider {
    static var previews: some View {
        MutationsCardView(mutation: Mutation.example)
            .environmentObject(Mutations())
    }
}
