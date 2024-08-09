//
//  String+ImageURL.swift
//  WarshipRip
//
//  Created by Pavlo on 06.08.2024.
//

import Foundation

extension String {
    var imageURL: URL? {
        let baseURL = "https://russianwarship.rip/images/icons"
        return URL(string: baseURL + self)
    }
}
