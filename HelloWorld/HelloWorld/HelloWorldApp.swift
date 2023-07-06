//
//  HelloWorldApp.swift
//  HelloWorld
//
//  Created by Raphael Peters on 06/07/2023.
//

import SwiftUI

@main
struct HelloWorldApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }

        ImmersiveSpace(id: "ImmersiveSpace") {
            ImmersiveView()
        }
    }
}
