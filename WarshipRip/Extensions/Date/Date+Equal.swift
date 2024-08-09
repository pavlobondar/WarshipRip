//
//  Date+Equal.swift
//  WarshipRip
//
//  Created by Pavlo on 08.08.2024.
//

import Foundation

extension Date {
    func areDatesEqual(to: Date) -> Bool {
        let calendar = Calendar.current
        
        let currentDate = calendar.dateComponents([.year, .month, .day], from: self)
        let toDate = calendar.dateComponents([.year, .month, .day], from: to)
        
        return currentDate == toDate
    }
}
