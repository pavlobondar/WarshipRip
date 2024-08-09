//
//  Endpoint.swift
//  WarshipRip
//
//  Created by Pavlo on 06.08.2024.
//

import Foundation

struct Endpoint {
    let path: String
    let queryItems: [URLQueryItem]
}

extension Endpoint {
    static func getLatest() -> Endpoint {
        return Endpoint(
            path: "/api/v2/statistics/latest",
            queryItems: []
        )
    }
    
    static func getByDate(_ date: String) -> Endpoint {
        return Endpoint(
            path: "/api/v2/statistics/\(date)",
            queryItems: []
        )
    }
}

extension Endpoint {
    var url: URL? {
        var components = URLComponents()
        components.scheme = "https"
        components.host = "russianwarship.rip"
        components.path = path
        components.queryItems = queryItems
        return components.url
    }
}
