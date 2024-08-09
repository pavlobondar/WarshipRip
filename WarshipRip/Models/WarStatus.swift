//
//  WarStatus.swift
//  WarshipRip
//
//  Created by Pavlo on 06.08.2024.
//

import Foundation

enum WarStatus: Int, Decodable {
    case inProgress = 1
    case armistice = 2
    case ukraineWon = 0
    
    var title: String {
        switch self {
        case .inProgress:
            return ""
        case .armistice:
            return "Перемирʼя"
        case .ukraineWon:
            return "Перемога України!"
        }
    }
}
