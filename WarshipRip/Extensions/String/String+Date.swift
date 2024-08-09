//
//  String+Date.swift
//  WarshipRip
//
//  Created by Pavlo on 07.08.2024.
//

import Foundation

extension String {
    func toDate() -> Date {
        let formater = DateFormatter()
        formater.locale = Locale(identifier: "uk_UA")
        formater.dateFormat = "YYYY-MM-DD"
        return formater.date(from: self) ?? .now
    }
}
