//
//  DBProjectTrackerApp.swift
//  DBProjectTracker
//
//  Created by Iris GalGal on 1/22/24.
//

import SwiftUI
import SwiftData

@main
struct DBProjectTracker: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .modelContainer(for: [Project.self, ProjectUpdate.self])
        }
    }
}
