//
//  BuildDetailView.swift
//  Buildout76
//
//  Created by Mark Strijdom on 08/04/2023.
//

import SwiftUI

struct BuildDetailView: View {
    let build: Build
    
    var body: some View {
        Text("Hello, this is your build.")
    }
}

struct BuildDetailView_Previews: PreviewProvider {
    static var previews: some View {
        BuildDetailView(build: Build.example)
    }
}
