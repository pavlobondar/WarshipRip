//
//  GeneralStatistics.swift
//  WarshipRip
//
//  Created by Pavlo on 06.08.2024.
//

import Foundation

struct GeneralStatistics: Decodable {
    let message: String
    let date: String
    let day: Int
    let resource: String
    let status: WarStatus
    let stats: Statistics
    let increase: Statistics
    
    var startDate: Date {
        let start = Calendar.current.date(
            from: DateComponents(year: 2022, month: 2, day: 24)
        )
        return start ?? Date()
    }
    
    var endDate: Date {
        return Date()
    }
    
    var statisticsDate: Date {
        return date.toDate()
    }
    
    var title: String {
        switch status {
        case .ukraineWon, .armistice:
            return status.title
        case .inProgress:
            return "\(day)-й день війни"
        }
    }
    
    var milGovUaImageURL: URL? {
        return URL(string: "https://russianwarship.rip/images/mil-logo.png")
    }
    
    var websparkURL: URL? {
        return URL(string: "https://www.webspark.ua/")
    }
    
    var russianwarshipURL: URL? {
        return URL(string: "https://russianwarship.rip")
    }
    
    var resourceURL: URL {
        return URL(string: resource)!
    }
    
    var units: WarStatistics {
        return WarStatistics(
            type: .personnelUnits,
            value: stats.personnelUnits,
            increase: increase.personnelUnits
        )
    }
    
    var updatedStatistics: [WarStatistics] {
        let statTypes = StatsType.allCases.filter { $0 != .personnelUnits }
        return statTypes.map {
            let value = stats.getValue(for: $0)
            let increase = increase.getValue(for: $0)
            let previousValue = value - increase
            return WarStatistics(
                type: $0,
                value: previousValue,
                increase: increase
            )
        }
        .filter { $0.isIncreased }
    }
    
    var warStatistics: [WarStatistics] {
        let statTypes = StatsType.allCases.filter { $0 != .personnelUnits }
        return statTypes.map {
            WarStatistics(
                type: $0,
                value: stats.getValue(for: $0),
                increase: 0
            )
        }
    }
    
    enum CodingKeys: String, CodingKey {
        case message = "message"
        case data = "data"
    }
    
    enum DataCodingKeys: String, CodingKey {
        case date = "date"
        case day = "day"
        case resource = "resource"
        case status = "war_status"
        case stats = "stats"
        case increase = "increase"
    }
    
    enum StatusCodingKeys: String, CodingKey {
        case code = "code"
        case alias = "alias"
    }
}

extension GeneralStatistics {
    init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        message = try container.decode(String.self, forKey: .message)
        
        let dataContainer = try container.nestedContainer(keyedBy: DataCodingKeys.self, forKey: .data)
        date = try dataContainer.decode(String.self, forKey: .date)
        day = try dataContainer.decode(Int.self, forKey: .day)
        resource = try dataContainer.decode(String.self, forKey: .resource)
        stats = try dataContainer.decode(Statistics.self, forKey: .stats)
        increase = try dataContainer.decode(Statistics.self, forKey: .increase)
        
        let statusContainer = try dataContainer.nestedContainer(keyedBy: StatusCodingKeys.self, forKey: .status)
        let statusCode = try statusContainer.decode(Int.self, forKey: .code)
        status = .init(rawValue: statusCode) ?? .inProgress
    }
}

extension GeneralStatistics {
    static func makeDefault() -> GeneralStatistics {
        return GeneralStatistics(
            message: "The data were fetched successfully.",
            date: "2022-04-14",
            day: 50,
            resource: "https://www.facebook.com/MinistryofDefence.UA/posts/295952562717203",
            status: .inProgress,
            stats: .init(
                personnelUnits: 19900,
                tanks: 753,
                armouredFightingVehicles: 1968,
                artillerySystems: 366,
                mlrs: 122,
                aaWarfareSystems: 64,
                planes: 160,
                helicopters: 144,
                vehiclesFuelTanks: 1437,
                warshipsCutters: 7,
                cruiseMissiles: 0,
                uavSystems: 134,
                specialMilitaryEquip: 25,
                atgmSrbmSystems: 4,
                submarines: 0
            ),
            increase: .init(
                personnelUnits: 100,
                tanks: 14,
                armouredFightingVehicles: 4,
                artillerySystems: 8,
                mlrs: 7,
                aaWarfareSystems: 0,
                planes: 2,
                helicopters: 1,
                vehiclesFuelTanks: 8,
                warshipsCutters: 0,
                cruiseMissiles: 0,
                uavSystems: 2,
                specialMilitaryEquip: 0,
                atgmSrbmSystems: 0,
                submarines: 0
            )
        )
    }
}
