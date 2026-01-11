//
//  Convict_Conditioning_ProApp.swift
//  Convict Conditioning Pro
//
//  Created by 顾艳华 on 2022/12/23.
//

import SwiftUI

@main
struct Convict_Conditioning_ProApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        return WindowGroup {
            ContentView(viewModel: ViewModel())
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
