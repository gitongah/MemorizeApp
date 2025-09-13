//
//  MemorizeApp.swift
//  Memorize
//
//  Created by Edwin Mbaabu on 9/9/25.
//

import SwiftUI

@main
struct MemorizeApp: App {
    @StateObject private var game = MemorizeViewModel()
    var body: some Scene {
        WindowGroup {
            CardGameView(viewModel: game)
        }
    }
}
