//
//  iOS_ChatGPTApp.swift
//  iOS-ChatGPT
//
//  Created by Mohammad Azam on 3/15/23.
//

import SwiftUI

@main
struct iOS_ChatGPTApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext,CoreDataManager.shared .persistentContainer.viewContext)
                .environmentObject(Model())
        }
    }
}
