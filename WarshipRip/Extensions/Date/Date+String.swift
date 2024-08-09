//
//  Date+String.swift
//  WarshipRip
//
//  Created by Pavlo on 08.08.2024.
//

import Foundation

extension Date {
    func toString() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        return formatter.string(from: self)
    }
}
