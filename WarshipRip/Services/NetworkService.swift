//
//  NetworkService.swift
//  WarshipRip
//
//  Created by Pavlo on 06.08.2024.
//

import Foundation
import Combine

struct NetworkService {
    
    static let shared = NetworkService()
    
    private init() {}
    
    func fecthLatestStatistics(date: String) -> AnyPublisher<GeneralStatistics, Error> {
        guard let url = Endpoint.getByDate(date).url else {
            return Fail(error: URLError(.badURL)).eraseToAnyPublisher()
        }
        
        return URLSession
            .shared
            .dataTaskPublisher(for: url)
            .map { $0.data }
            .decode(type: GeneralStatistics.self, decoder: JSONDecoder())
            .eraseToAnyPublisher()
    }
}
