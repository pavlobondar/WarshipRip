//
//  WarshipRipApp.swift
//  WarshipRip
//
//  Created by Pavlo on 06.08.2024.
//

import SwiftUI
import SDWebImageSVGCoder

@main
struct WarshipRipApp: App {
    
    init() {
        SDImageCodersManager.shared.addCoder(SDImageSVGCoder.shared)
    }
    
    var body: some Scene {
        WindowGroup {
            StatisticsView()
        }
    }
}
