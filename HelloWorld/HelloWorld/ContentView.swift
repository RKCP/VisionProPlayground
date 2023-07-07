//
//  ContentView.swift
//  HelloWorld
//
//  Created by Raphael Peters on 06/07/2023.
//

import SwiftUI
import RealityKit
import RealityKitContent

struct ContentView: View {

    @State var diveIntoVisionPro = false

    @Environment(\.openImmersiveSpace) var openImmersiveSpace
    @Environment(\.dismissImmersiveSpace) var dismissImmersiveSpace

    var body: some View {
        NavigationSplitView {
            List {
                Text("Groceries")
                Text("Reminders")
                Text("Business")
                Text("Podcast")
                Text("Book")
                Text("Counselling")
            }
            .navigationTitle("To Do Lists")
        } detail: {
            VStack {
                Model3D(named: "Scene", bundle: realityKitContentBundle)
                    .padding(.bottom, 50)

                Text("Hello, Raphael!")

                Toggle("Dive Into Todays Task", isOn: $diveIntoVisionPro)
                    .toggleStyle(.button)
                    .padding(.top, 10)
            }
            .navigationTitle("Content")
            .padding()
        }
        .onChange(of: diveIntoVisionPro) { _, newValue in
            Task {
                if newValue {
                    await openImmersiveSpace(id: "ImmersiveSpace")
                } else {
                    await dismissImmersiveSpace()
                }
            }
        }
        .shadow(
            color: .blue,
            radius: 100
            
        )
    }
}

#Preview {
    ContentView()
}
