//
//  ContentView.swift
//  lab1
//
//  Created by ІПЗ-31/2 on 11.09.2026.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "house")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Wellcome!")
                .font(.title2)
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
