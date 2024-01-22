//
//  ContentView.swift
//  DBProjectTracker
//
//  Created by Iris GalGal on 1/22/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image("cross")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
                .font(Font.screenHeading)
                .foregroundStyle(Color("Olive"))
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
