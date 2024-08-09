//
//  WarStatistics.swift
//  WarshipRip
//
//  Created by Pavlo on 08.08.2024.
//

import Foundation

struct WarStatistics: Identifiable, Equatable {
    let id: String
    let type: StatsType
    let value: String
    let increase: String
    
    var isIncreased: Bool {
        return !increase.isEmpty
    }
    
    init(type: StatsType, value: Int, increase: Int) {
        self.id = UUID().uuidString
        self.type = type
        self.value = String(value)
        self.increase = increase > 0 ? "+\(increase)" : ""
    }
}
