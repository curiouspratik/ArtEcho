//
//  ContentView.swift
//  artEcho
//
//  Created by Pratik Ashok Patil on 24/03/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "sun")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("ArtEcho")
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
